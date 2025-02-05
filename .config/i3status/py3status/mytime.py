class Py3status:

    def __init__(self):
        self.show_time = False

    def mytime(self):
        from datetime import datetime
        if self.show_time:
            return {
                'full_text': datetime.now().strftime('%a %Y-%m-%d %H:%M:%S '),
                'cached_until': self.py3.time_in(1),
            }
        else:
            return {
                'full_text': datetime.now().strftime('%a %Y-%m-%d '),
                'cached_until': self.py3.time_in(60),
            }

    def on_click(self, event):
        self.show_time = not self.show_time
