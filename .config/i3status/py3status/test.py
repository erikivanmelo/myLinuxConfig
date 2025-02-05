import psutil
import subprocess

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
    return psutil.cpu_percent(interval=1)

def get_memory_usage():
    memory = psutil.virtual_memory()
    return memory.percent

if __name__ == "__main__":
    cpu_temp = get_cpu_temperature()
    cpu_usage = get_cpu_usage()
    memory_usage = get_memory_usage()

    print(f"Temperatura de la CPU: {cpu_temp}")
    print(f"Uso de CPU: {cpu_usage}%")
    print(f"Uso de RAM: {memory_usage}%")
