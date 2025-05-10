from selenium import webdriver
from selenium.webdriver.common.by import By
from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from libreria.tests.pruebas_unitarias.utils import log_test_info
import time

class NavegacionBasicaTest(StaticLiveServerTestCase):

    def setUp(self):
        print("\n[SETUP] Iniciando el navegador para prueba de navegación básica...")
        self.browser = webdriver.Chrome()

    def tearDown(self):
        print("\n[TEARDOWN] Cerrando el navegador...")
        self.browser.quit()
        print("[TEARDOWN] Navegador cerrado con éxito.")

    def navegar_lento(self, by, value, espera=2):
        elemento = self.browser.find_element(by, value)
        time.sleep(espera)
        elemento.click()
        time.sleep(espera)

    @log_test_info
    def test_navegacion_inicio_registro_login_nosotros(self):
        """Prueba: ir a inicio, luego registro, luego login, luego nosotros y cerrar lentamente."""
        print("\n[TEST] Navegando a la página de inicio...")
        self.browser.get(self.live_server_url + '/')
        print("[TEST] Página de inicio cargada. Esperando 2 segundos...")
        time.sleep(2)

        print("[TEST] Navegando a la página de registro lentamente...")
        self.navegar_lento(By.LINK_TEXT, 'Registrarse', espera=2)

        print("[TEST] Navegando a la página de login lentamente...")
        self.navegar_lento(By.LINK_TEXT, 'Iniciar Sesión', espera=2)

        print("[TEST] Navegando a la página de nosotros lentamente...")
        self.navegar_lento(By.LINK_TEXT, 'Nosotros', espera=2)

        print("[TEST] Página de nosotros cargada. Esperando 3 segundos antes de cerrar...")
        time.sleep(3)

        print("[TEST] Prueba de navegación básica finalizada.")