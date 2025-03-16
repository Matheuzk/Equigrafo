from selenium import webdriver
from selenium.webdriver.common.by import By
from django.test import LiveServerTestCase
from .models import Usuario

class UsuarioLoginTest(LiveServerTestCase):

    def setUp(self):
        self.browser = webdriver.Chrome()
        Usuario.objects.create_user(email='testuser@example.com', username='testuser', password='password123')

    def tearDown(self):
        self.browser.quit()

    def test_usuario_login(self):
        self.browser.get(self.live_server_url + '/login/')
        email_input = self.browser.find_element(By.NAME, 'email')
        password_input = self.browser.find_element(By.NAME, 'password')
        email_input.send_keys('testuser@example.com')
        password_input.send_keys('password123')
        self.browser.find_element(By.XPATH, '//button[@type="submit"]').click()
        self.assertIn('Inicio', self.browser.title)