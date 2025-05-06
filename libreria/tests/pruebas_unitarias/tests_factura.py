from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse
from ...models import camaras_base, Factura, ProductoFactura

class FacturarTestCase(TestCase):
    def setUp(self):
        # Configuración inicial del entorno de prueba
        print("\n=== Prueba: Facturación ===")
        
        # Crear un usuario
        self.user = get_user_model().objects.create_user(
            email="testuser@example.com",
            username="testuser",
            password="password123",
            cargo="Gerente"
        )
        self.client.login(email="testuser@example.com", password="password123")

        # Crear un producto
        self.camara = camaras_base.objects.create(
            titulo="Cámara Nikon",
            descripcion="Cámara profesional de alta calidad",
            cantidad=10,
            precio=500.00,
            precio_compra=300.00
        )

    def test_facturar_crea_factura(self):
        # Inicio de la prueba de facturación
        print("Iniciando prueba de creación de factura...")

        # Preparar datos para la solicitud POST
        productos = f"{self.camara.id},2,{self.camara.precio}"
        total_pagado = 1000.00

        # Enviar solicitud POST
        response = self.client.post(reverse('facturar'), {
            'productos': productos,
            'total_pagado': total_pagado
        }, HTTP_X_REQUESTED_WITH='XMLHttpRequest')

        # Verificar que la respuesta sea exitosa
        self.assertEqual(response.status_code, 200)

        # Verificar que se haya creado la factura
        factura = Factura.objects.first()
        self.assertIsNotNone(factura)

        # Verificar que se haya creado el ProductoFactura
        producto_factura = ProductoFactura.objects.first()
        self.assertIsNotNone(producto_factura)

        # Verificar que el inventario del producto se haya actualizado
        self.camara.refresh_from_db()
        self.assertEqual(self.camara.cantidad, 8)

        print("Prueba de facturación completada exitosamente.")