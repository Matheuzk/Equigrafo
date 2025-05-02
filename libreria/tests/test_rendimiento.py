import time
from django.test import TestCase
from django.urls import reverse

class PerformanceTests(TestCase):
    def setUp(self):
        print("\n[SETUP] Configurando el entorno de prueba para PerformanceTests...")
        self.start_time = time.time()

    def tearDown(self):
        elapsed_time = time.time() - self.start_time
        print(f"\n[TEARDOWN] {self._testMethodName} tomó {elapsed_time:.3f} segundos.")
        print("[TEARDOWN] Entorno de prueba limpiado con éxito.")

    def test_inicio_performance(self):
        """
        Prueba de rendimiento para la vista 'inicio'.
        Mide el tiempo de respuesta y asegura que sea menor a 1 segundo.
        """
        print("\n[TEST] Iniciando prueba de rendimiento para la vista 'inicio'...")
        start_time = time.time()

        print("[TEST] Enviando solicitud GET a la vista 'inicio'...")
        response = self.client.get(reverse('inicio'))

        end_time = time.time()
        duration = end_time - start_time

        print(f"[TEST] Respuesta recibida con código de estado: {response.status_code}")
        self.assertEqual(response.status_code, 200, "[ERROR] La vista 'inicio' no devolvió un código 200.")
        print("[TEST] Código de estado 200 verificado correctamente.")

        print(f"[TEST] Tiempo de respuesta: {duration:.3f} segundos.")
        self.assertLess(duration, 1, f"[ERROR] La vista 'inicio' tardó demasiado: {duration:.2f} segundos.")
        print("[TEST] Tiempo de respuesta dentro del límite permitido (< 1 segundo).")