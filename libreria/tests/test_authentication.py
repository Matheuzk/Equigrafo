import time
from django.test import TestCase
from django.urls import reverse

class SimpleSecurityTest(TestCase):
    def setUp(self):
        print("\n[SETUP] Configurando el entorno de prueba para SimpleSecurityTest...")
        self.start_time = time.time()

    def tearDown(self):
        elapsed_time = time.time() - self.start_time
        print(f"\n[TEARDOWN] {self._testMethodName} tomó {elapsed_time:.3f} segundos.")
        print("[TEARDOWN] Entorno de prueba limpiado con éxito.")

    def test_protected_views_redirect_to_login(self):
        """Prueba que las vistas protegidas redirijan al inicio de sesión."""
        print("\n[TEST] Verificando redirección de vistas protegidas a la página de inicio de sesión...")
        protected = [
            reverse('camaras'),
            reverse('facturar'),
            reverse('detalles_factura'),
        ]
        for url in protected:
            print(f"[TEST] Accediendo a la URL protegida: {url}")
            resp = self.client.get(url)
            self.assertEqual(resp.status_code, 302, f"[ERROR] La URL {url} no redirigió correctamente.")
            print(f"[TEST] La URL {url} redirigió correctamente con estado 302.")
            self.assertIn(reverse('login'), resp.url, f"[ERROR] La URL {url} no redirigió al inicio de sesión.")
            print(f"[TEST] La URL {url} redirigió correctamente al inicio de sesión.")