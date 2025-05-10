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

    @log_test_info
    def test_navegacion_inicio_registro_login_nosotros(self):
        """Prueba: ir a inicio, luego registro, luego login, luego nosotros y cerrar."""
        print("\n[TEST] Navegando a la página de inicio...")
        self.browser.get(self.live_server_url + '/')
        print("[TEST] Página de inicio cargada. Esperando 1 segundo...")
        time.sleep(1)

        print("[TEST] Navegando a la página de registro...")
        self.browser.find_element(By.LINK_TEXT, 'Registrarse').click()
        print("[TEST] Página de registro cargada. Esperando 1 segundo...")
        time.sleep(1)

        print("[TEST] Navegando a la página de login...")
        self.browser.find_element(By.LINK_TEXT, 'Iniciar Sesión').click()
        print("[TEST] Página de login cargada. Esperando 1 segundo...")
        time.sleep(1)

        print("[TEST] Navegando a la página de nosotros...")
        self.browser.find_element(By.LINK_TEXT, 'Nosotros').click()
        print("[TEST] Página de nosotros cargada. Esperando 2 segundos...")
        time.sleep(2)

        print("[TEST] Prueba de navegación básica finalizada.")