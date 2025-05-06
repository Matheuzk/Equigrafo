from selenium import webdriver
from selenium.webdriver.common.by import By
from django.test import LiveServerTestCase
from ...models import Usuario
from ..pruebas_unitarias.utils import log_test_info
from django.test import LiveServerTestCase
from django.contrib.staticfiles.testing import StaticLiveServerTestCase  

class UsuarioLoginTest(StaticLiveServerTestCase):

    def setUp(self):
        print("\n[SETUP] Iniciando el navegador y configurando el entorno de prueba...")
        self.browser = webdriver.Chrome()
        Usuario.objects.create_user(email='testuser@example.com', username='testuser', password='password123')
        print("[SETUP] Usuario de prueba creado con éxito.")

    def tearDown(self):
        print("\n[TEARDOWN] Cerrando el navegador...")
        self.browser.quit()
        print("[TEARDOWN] Navegador cerrado con éxito.")

    @log_test_info
    def test_usuario_login(self):
        """Prueba el inicio de sesión de un usuario válido."""
        print("\n[TEST] Navegando a la página de inicio de sesión...")
        self.browser.get(self.live_server_url + '/login/')
        print("[TEST] Página de inicio de sesión cargada con éxito.")

        print("[TEST] Rellenando el formulario de inicio de sesión...")
        email_input = self.browser.find_element(By.NAME, 'email')
        password_input = self.browser.find_element(By.NAME, 'password')
        email_input.send_keys('testuser@example.com')
        password_input.send_keys('password123')
        print("[TEST] Formulario rellenado con éxito.")

        print("[TEST] Enviando el formulario...")
        self.browser.find_element(By.XPATH, '//button[@type="submit"]').click()
        print("[TEST] Formulario enviado. Verificando el título de la página...")

        
        self.assertIn('Mi Sitio Web', self.browser.title)  
        print("[TEST] Inicio de sesión exitoso. El título de la página contiene 'Inicio'.")