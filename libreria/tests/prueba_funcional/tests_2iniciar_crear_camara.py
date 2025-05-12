from selenium import webdriver
from selenium.webdriver.common.by import By
from django.contrib.staticfiles.testing import StaticLiveServerTestCase  
from ...models import Usuario
from libreria.tests.pruebas_unitarias.utils import log_test_info
import time
import os

class UsuarioLoginTest(StaticLiveServerTestCase):

    def setUp(self):
        print("\n[SETUP] Iniciando el navegador y configurando el entorno de prueba...")
        self.browser = webdriver.Chrome()
        Usuario.objects.create_user(email='juliana@gamil.com', username='juliana', password='1649', cargo='Gerente')
        print("[SETUP] Usuario de prueba creado con éxito.")

    def tearDown(self):
        print("\n[TEARDOWN] Cerrando el navegador...")
        self.browser.quit()
        print("[TEARDOWN] Navegador cerrado con éxito.")

    def escribir_lento(self, input_element, texto):
        input_element.clear()
        for c in texto:
            input_element.send_keys(c)
            time.sleep(0.12)

    def escribir_rapido(self, input_element, texto):
        input_element.clear()
        input_element.send_keys(texto)
        time.sleep(0.05)

    @log_test_info
    def test_usuario_login_y_varias_camaras(self):
       
        print("\n[TEST] Navegando a la página de inicio...")
        self.browser.get(self.live_server_url + '/')
        time.sleep(1)

        print("[TEST] Navegando a la página de login...")
        self.browser.find_element(By.LINK_TEXT, 'Iniciar Sesión').click()
        time.sleep(0.5)

        print("[TEST] Rellenando el formulario de login lentamente...")
        email_input = self.browser.find_element(By.NAME, 'email')
        self.escribir_lento(email_input, 'juliana@gamil.com')
        password_input = self.browser.find_element(By.NAME, 'password')
        self.escribir_lento(password_input, '1649')
        time.sleep(0.5)

        print("[TEST] Enviando el formulario de login...")
        self.browser.find_element(By.XPATH, '//button[@type="submit"]').click()
        time.sleep(1)

        print("[TEST] Buscando y haciendo clic en el botón 'Cámaras'...")
        self.browser.find_element(By.LINK_TEXT, 'Cámaras').click()
        time.sleep(1)

        print("[TEST] Haciendo clic en 'Agregar nueva cámara' para cámara de prueba...")
        self.browser.find_element(By.LINK_TEXT, 'Agregar nueva cámara').click()
        time.sleep(0.5)

        print("[TEST] Llenando el formulario de cámara de prueba lentamente...")
        self.escribir_lento(self.browser.find_element(By.NAME, 'titulo'), 'Cámara de Prueba')
        self.escribir_lento(self.browser.find_element(By.NAME, 'descripcion'), 'Cámara agregada por test funcional')
        self.escribir_lento(self.browser.find_element(By.NAME, 'cantidad'), '5')
        self.escribir_lento(self.browser.find_element(By.NAME, 'precio'), '1200')
        self.escribir_lento(self.browser.find_element(By.NAME, 'precio_compra'), '900')
        test_image_path = os.path.abspath('libreria/tests/media/test.jpg')
        self.browser.find_element(By.NAME, 'image').send_keys(test_image_path)
        time.sleep(0.5)

        print("[TEST] Enviando el formulario de cámara de prueba...")
        self.browser.find_element(By.XPATH, "//input[@type='submit' and @value='Enviar Información']").click()
        time.sleep(1)

      
        print("[TEST] Haciendo clic en 'Agregar nueva cámara' para Nikon...")
        self.browser.find_element(By.LINK_TEXT, 'Agregar nueva cámara').click()
        time.sleep(0.5)

        print("[TEST] Llenando el formulario de cámara Nikon muy rápido...")
        self.escribir_rapido(self.browser.find_element(By.NAME, 'titulo'), 'Nikon')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'descripcion'), 'Cámara Nikon profesional')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'cantidad'), '10')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'precio'), '2500')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'precio_compra'), '1800')
        test_image_path = os.path.abspath('libreria/tests/media/Nikon.jpg')
        self.browser.find_element(By.NAME, 'image').send_keys(test_image_path)
        time.sleep(0.2)

        print("[TEST] Enviando el formulario de cámara Nikon...")
        self.browser.find_element(By.XPATH, "//input[@type='submit' and @value='Enviar Información']").click()
        time.sleep(1)

       
        print("[TEST] Haciendo clic en 'Agregar nueva cámara' para Sony...")
        self.browser.find_element(By.LINK_TEXT, 'Agregar nueva cámara').click()
        time.sleep(0.5)

        print("[TEST] Llenando el formulario de cámara Sony muy rápido...")
        self.escribir_rapido(self.browser.find_element(By.NAME, 'titulo'), 'Sony')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'descripcion'), 'Cámara Sony mirrorless')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'cantidad'), '7')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'precio'), '3200')
        self.escribir_rapido(self.browser.find_element(By.NAME, 'precio_compra'), '2500')
        test_image_path = os.path.abspath('libreria/tests/media/Sony.jpg')
        self.browser.find_element(By.NAME, 'image').send_keys(test_image_path)
        time.sleep(0.2)

        print("[TEST] Enviando el formulario de cámara Sony...")
        self.browser.find_element(By.XPATH, "//input[@type='submit' and @value='Enviar Información']").click()
        print("[TEST] Cámaras creadas. Esperando 20 segundos en la lista de cámaras...")
        time.sleep(20)
        print("[TEST] Prueba finalizada, cerrando navegador.")