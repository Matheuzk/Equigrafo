def log_test_info(func):
    def wrapper(*args, **kwargs):
        print(f"[INFO] Ejecutando {func.__name__}...")
        return func(*args, **kwargs)
    return wrapper