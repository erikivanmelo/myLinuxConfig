import shutil

class Py3status:
    partition = "/"
    name = "🖴"
    DISPLAY_FREE = 1
    DISPLAY_USED_PERCENTAGE = 2
    display = 0

    def space(self):
        if self.display == 0:
            return {
                'full_text': self.name,
                'cached_until': 1,
            }

        usage = shutil.disk_usage(self.partition)

        free_gb = usage.free / (1024 ** 3)  # Libre en GB
        used_percentage = (usage.used / usage.total) * 100  # Porcentaje usado

        display_texts = {
            self.DISPLAY_FREE: f"{self.name}{round(free_gb, 2)} GB",
            self.DISPLAY_USED_PERCENTAGE: f"{self.name}{round(used_percentage)}%"
        }

        full_text = display_texts.get(self.display, self.name)

        return {
            'full_text': full_text,
            'cached_until': self.py3.time_in(1),
        }

    def on_click(self, event):
        self.display = (self.display + 1) % 3
