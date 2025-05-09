from django.test import TestCase, Client
from django.urls import reverse
from libreria.models import Usuario, camaras_base, Factura, ProductoFactura

class GeneracionPDFTest(TestCase):
    def setUp(self):
        print("\n=== Prueba: Generación de PDF de Factura ===")
        self.user = Usuario.objects.create_user(
            email="pdfuser@example.com",
            username="pdfuser",
            password="password123",
            cargo="Gerente"
        )
        self.camara = camaras_base.objects.create(
            titulo="Cámara Canon",
            descripcion="Cámara profesional",
            cantidad=5,
            precio=1000.00,
            precio_compra=700.00
        )
        self.factura = Factura.objects.create(
            empleado=self.user,
            total_pagado=2000.00,
            total_vendido=2000.00,
            restante=0.00
        )
        ProductoFactura.objects.create(
            factura=self.factura,
            producto=self.camara,
            cantidad=2,
            precio_unitario=1000.00
        )
        self.client = Client()
        self.client.login(email="pdfuser@example.com", password="password123")

    def test_generar_pdf_factura(self):
        print("Solicitando generación de PDF de factura...")
        url = reverse('generar_pdf', args=[self.factura.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/pdf')
        self.assertTrue(response.content.startswith(b'%PDF'))
        print("PDF generado y recibido correctamente.")