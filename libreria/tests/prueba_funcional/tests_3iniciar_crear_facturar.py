from selenium import webdriver
from selenium.webdriver.common.by import By
from django.contrib.staticfiles.testing import StaticLiveServerTestCase  
from ...models import Usuario
from libreria.tests.pruebas_unitarias.utils import log_test_info
import time
import os

class FacturarTest(StaticLiveServerTestCase):

    def setUp(self):
        print("\n[SETUP] Iniciando el navegador y configurando el entorno de prueba...")
        self.browser = webdriver.Chrome()
        Usuario.objects.create_user(email='valenciarojaskm@gmail.com', username='valencia', password='1649', cargo='Gerente')
        print("[SETUP] Usuario de prueba creado con éxito.")

    def tearDown(self):
        print("\n[TEARDOWN] Cerrando el navegador...")
        self.browser.quit()
        print("[TEARDOWN] Navegador cerrado con éxito.")

    def escribir_lento(self, input_element, texto, delay=0.12):
        input_element.clear()
        for c in texto:
            input_element.send_keys(c)
            time.sleep(delay)

    @log_test_info
    def test_crear_y_facturar_camara(self):
        print("\n[TEST] Navegando a la página de inicio...")
        self.browser.get(self.live_server_url + '/')
        time.sleep(1)

        print("[TEST] Navegando a la página de login...")
        self.browser.find_element(By.LINK_TEXT, 'Iniciar Sesión').click()
        time.sleep(0.5)

        print("[TEST] Rellenando el formulario de login lentamente...")
        email_input = self.browser.find_element(By.NAME, 'email')
        self.escribir_lento(email_input, 'valenciarojaskm@gmail.com', 0.10)
        password_input = self.browser.find_element(By.NAME, 'password')
        self.escribir_lento(password_input, '1649', 0.18)
        time.sleep(0.5)

        print("[TEST] Enviando el formulario de login...")
        self.browser.find_element(By.XPATH, '//button[@type="submit"]').click()
        time.sleep(1)

        print("[TEST] Navegando a la página de Cámaras...")
        self.browser.find_element(By.LINK_TEXT, 'Cámaras').click()
        time.sleep(1)

        print("[TEST] Haciendo clic en 'Agregar nueva cámara'...")
        self.browser.find_element(By.LINK_TEXT, 'Agregar nueva cámara').click()
        time.sleep(0.5)

        print("[TEST] Llenando el formulario de cámara lentamente...")
        self.escribir_lento(self.browser.find_element(By.NAME, 'titulo'), 'Cámara Factura', 0.10)
        self.escribir_lento(self.browser.find_element(By.NAME, 'descripcion'), 'Cámara para prueba de facturación', 0.06)
        self.escribir_lento(self.browser.find_element(By.NAME, 'cantidad'), '3', 0.12)
        self.escribir_lento(self.browser.find_element(By.NAME, 'precio'), '1500', 0.08)
        self.escribir_lento(self.browser.find_element(By.NAME, 'precio_compra'), '1000', 0.08)
        test_image_path = os.path.abspath('libreria/tests/media/test.jpg')
        self.browser.find_element(By.NAME, 'image').send_keys(test_image_path)
        time.sleep(0.5)

        print("[TEST] Enviando el formulario de cámara...")
        self.browser.find_element(By.XPATH, "//input[@type='submit' and @value='Enviar Información']").click()
        print("[TEST] Cámara creada. Esperando 5 segundos...")
        time.sleep(5)

        print("[TEST] Navegando a la página de facturación...")
        self.browser.get(self.live_server_url + '/facturar/')
        time.sleep(1)

        print("[TEST] Seleccionando la cámara creada dos veces (lento)...")
        # Buscar la cámara por su título
        camara_links = self.browser.find_elements(By.CLASS_NAME, 'list-group-item-action')
        for link in camara_links:
            if 'Cámara Factura' in link.text:
                link.click()
                time.sleep(0.7)
                link.click()
                time.sleep(0.7)
                break

        print("[TEST] Ingresando monto a pagar (lento)...")
        payment_input = self.browser.find_element(By.ID, 'payment-amount')
        self.escribir_lento(payment_input, '3000', 0.15)
        time.sleep(0.5)

        print("[TEST] Finalizando compra...")
        self.browser.find_element(By.ID, 'finalize-purchase').click()
        print("[TEST] Esperando 7 segundos tras finalizar compra...")
        time.sleep(7)

        print("[TEST] Volviendo a Cámaras...")
        self.browser.get(self.live_server_url + '/camaras')
        time.sleep(5)

        print("[TEST] Regresando a facturar...")
        self.browser.get(self.live_server_url + '/facturar/')
        time.sleep(1)

        print("[TEST] Dando clic en 'Ver Detalles'...")
        self.browser.find_element(By.ID, 'view-details').click()
        time.sleep(2)

        print("[TEST] Dando clic en botón PDF de la última factura...")
        # Esperar a que cargue la tabla y buscar el primer botón PDF
        pdf_buttons = self.browser.find_elements(By.CLASS_NAME, 'btn-pastel-pdf')
        if pdf_buttons:
            pdf_buttons[0].click()
        print("[TEST] Esperando 10 segundos tras descargar PDF...")
        time.sleep(10)

        print("[TEST] Prueba finalizada, cerrando navegador.")