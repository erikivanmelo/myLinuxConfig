import psutil
import subprocess

class Py3status:

    def resources_monitor(self):
        def get_cpu_temperature():
            try:
                # Ejecuta el comando 'sensors' y captura la salida
                output = subprocess.check_output(['sensors']).decode('utf-8')
                # Busca la línea que contiene la temperatura de la CPU
                for line in output.split('\n'):
                    if 'Core' in line:  # Cambia esto según tu salida de sensors
                        # Extrae la temperatura
                        temp = line.split(':')[1].strip().split()[0]
                        return temp
            except Exception as e:
                return f"Error al obtener la temperatura: {e}"

        def get_cpu_usage():
            return psutil.cpu_percent()

        def get_ram():
            memory = psutil.virtual_memory()
            return memory.percent

        return {
            'full_text': f"RAM: {get_ram()}% | CPU: {get_cpu_usage()}% {get_cpu_temperature()}",
            'cached_until': self.py3.time_in(1),
        }
