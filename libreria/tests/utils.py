import time
from functools import wraps

def log_test_info(test_func):
    @wraps(test_func)
    def wrapper(*args, **kwargs):
        print(f"\n{'='*40}")
        print(f"Ejecutando prueba: {test_func.__name__}")
        print(f"Descripción: {test_func.__doc__}")  # Muestra la docstring de la prueba
        start_time = time.time()
        result = test_func(*args, **kwargs)
        elapsed_time = time.time() - start_time
        print(f"Prueba completada: {test_func.__name__}")
        print(f"Tiempo de ejecución: {elapsed_time:.3f} segundos")
        print(f"{'='*40}")
        return result
    return wrapper