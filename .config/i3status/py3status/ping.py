import psutil
import subprocess

class Py3status:
    name = "🖧"
    show_ping = True
    host = "8.8.8.8"
    _last_up = 1
    _last_down = 1

    def ping(self):
        def get_ping():
            try:
                output = subprocess.check_output(['ping', '-c', '1', self.host])
                for line in output.splitlines():
                    if b'time=' in line:
                        ping_time = line.split(b'time=')[1].split(b' ')[0]
                        return float(ping_time)
            except Exception as e:
                return -1.0

        def get_network_usage():
            net_io = psutil.net_io_counters()
            return net_io.bytes_sent, net_io.bytes_recv

        if self.show_ping:
            ping = get_ping()
            current_up, current_down = get_network_usage()

            up_speed = (current_up - self._last_up) / 1024
            down_speed = (current_down - self._last_down) / 1024

            r = {
                'full_text': f"{self.name} {ping:.2f} ms ⇑{up_speed:.2f} KB/s ⇓{down_speed:.2f} KB/s",
                'cached_until': self.py3.time_in(1),
            }
            self._last_up, self._last_down = current_up, current_down
            return r

        else:
            return {
                'full_text': self.name,
                'cached_until': self.py3.time_in(60),
            }

    def on_click(self, event):
        self._last_up, self._last_down = 1, 1
        self.show_ping = not self.show_ping
