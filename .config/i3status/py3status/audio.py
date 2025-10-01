import subprocess
from re import search, Match
from typing import Optional, Tuple


def get_default_output() -> str:
    """
    Returns the name of the current default audio output.
    """
    result = subprocess.run(['pactl', 'info'], capture_output=True, text=True)
    for line in result.stdout.splitlines():
        if "Default Sink:" in line:
            return line.split(": ")[1]
    return ""


def get_volume_and_mute_status(device_name: str) -> Optional[Tuple[bool, int]]:
    """
    Retrieves the mute status and volume percentage of the specified audio output device.
    """
    result = subprocess.run(['pactl', 'list', 'sinks'], capture_output=True, text=True)
    output: str = result.stdout

    # Split the output into sections, one for each audio device
    audio_devices: list[str] = output.split('\n\n')
    for device in audio_devices:
        if device_name in device:
            muted_match: Match | None = search(r'Mute:\s+(yes|no)', device)
            volume_match: Match | None = search(r'Volume:.*?(\d+)%', device)

            if muted_match and volume_match:
                is_muted: bool = muted_match.group(1).lower() == 'yes'
                volume = int(volume_match.group(1))
                return is_muted, volume

    return None


def update_outputs() -> tuple[list[str], int]:
    """
    Updates the list of available audio outputs and sets the current output index.
    """
    default_output = get_default_output()

    result = subprocess.run(['pactl', 'list', 'sinks'], capture_output=True, text=True)
    outputs: list[str] = [
        line.split(": ")[1] for line in result.stdout.splitlines() if "Name:" in line
    ]

    current_output_index: int = outputs.index(default_output) if default_output in outputs else 0

    return outputs, current_output_index


def parse_output_aliases(output_aliases: str, outputs: list[str]) -> dict[str, str]:
    """
    Converts the output_aliases string into a dictionary that maps output names to their aliases.

    Example input:
        output_aliases = "
            bluez_output.84_AC_60_29_EE_08.1:🎧,
            alsa_output.pci-0000_00_lf.3.analog-stereo:🔊
        "

    Example output:
        {
            "bluez_output.84_AC_60_29_EE_08.1": "🎧",
            "alsa_output.pci-0000_00_lf.3.analog-stereo": "🔊"
        }
    """
    # Initialize the dictionary with outputs mapping to themselves
    alias_dict: dict[str, str] = {output: output for output in outputs}

    # Return early if no aliases are provided
    if not output_aliases:
        return alias_dict

    # Clean and split the alias string into key-value pairs
    output_aliases = output_aliases.strip().strip('"')
    alias_pairs = [pair.strip() for pair in output_aliases.split(",") if pair.strip()]

    # Process each alias pair and update the dictionary
    for pair in alias_pairs:
        key, value = pair.split(":", 1)  # Split into key and value
        key, value = key.strip(), value.strip()  # Clean extra spaces
        if key in alias_dict:  # Only update if the key exists in outputs
            alias_dict[key] = value

    return alias_dict


class Py3status:
    outputs: list[str] = []
    current_output_index: int = 0

    output_aliases: str = ""
    muted_color: str = '#FF0000'
    volume_step: int = 1
    interval: float = 0.1

    def audio(self) -> dict:
        """
        Returns the audio information for the current output.
        """
        self.outputs, self.current_output_index = update_outputs()
        output_aliases_dict: dict[str, str] = parse_output_aliases(self.output_aliases, self.outputs)

        current_output: str = self.outputs[self.current_output_index]
        volume_info: Tuple[bool, int] | None = get_volume_and_mute_status(current_output)

        if not volume_info:
            return {"full_text": "Error: Unable to fetch volume info", "color": "#FF0000"}

        is_muted, volume = volume_info

        current_output = output_aliases_dict[current_output]
        response = {
            'full_text': f"{current_output}: {volume}%",
            'cached_until': self.py3.time_in(self.interval),
        }
        if is_muted:
            response['color'] = self.muted_color

        return response

    def on_click(self, event: dict):
        """
        Handles mouse click events:
        - Left click (button 1): Toggles mute/unmute.
        - Right click (button 3): Cycles through available audio outputs.
        - Scroll up (button 4): Increases the volume.
        - Scroll down (button 5): Decreases the volume.
        """
        button = event.get("button")
        current_output: str = self.outputs[self.current_output_index]

        if button == 1:
            # Toggle mute/unmute
            volume_info: Tuple[bool, int] | None = get_volume_and_mute_status(current_output)
            if volume_info:
                is_muted, _ = volume_info
                mute_action = 'unmute' if is_muted else 'mute'
                subprocess.run(['amixer', '-D', 'pulse', 'set', 'Master', mute_action], stdout=False)

        elif button == 3:
            # Cycle to the next audio output
            self.current_output_index = (self.current_output_index + 1) % len(self.outputs)
            new_output_name: str = self.outputs[self.current_output_index]
            subprocess.run(['pactl', 'set-default-sink', new_output_name])

        elif button == 4:
            # Increase volume
            subprocess.run(['pactl', 'set-sink-volume', current_output, f"+{self.volume_step}%"])

        elif button == 5:
            # Decrease volume
            subprocess.run(['pactl', 'set-sink-volume', current_output, f"-{self.volume_step}%"])
