from django.test import TestCase, Client
from django.urls import reverse
from libreria.models import Usuario
from django.utils import timezone

class EmpleadosViewsTest(TestCase):
    def setUp(self):
        print("\n=== Prueba: Vista de Empleados y Detalles ===")
       
        self.gerente = Usuario.objects.create_user(
            email='gerente@test.com',
            username='gerente',
            password='testpass123',
            nombre='Gerente',
            apellido='Test',
            cedula='123456789',
            cargo='Gerente'
        )
     
        self.asistente = Usuario.objects.create_user(
            email='asistente@test.com',
            username='asistente',
            password='testpass123',
            nombre='Asistente',
            apellido='Test',
            cedula='987654321',
            cargo='Asistente'
        )
        self.client = Client()
        self.client.login(email='gerente@test.com', password='testpass123')

    def test_empleados_view(self):
        print("Iniciando prueba de vista de empleados...")
        url = reverse('empleados')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Gerente Test')
        self.assertContains(response, 'Asistente Test')
        self.assertContains(response, 'Cargo:</strong> Gerente')
        self.assertContains(response, 'Cargo:</strong> Asistente')
        print("Vista de empleados verificada correctamente.")
        

    def test_empleado_detalles_view(self):
        print("Iniciando prueba de detalles de empleado...")
        url = reverse('empleado_detalles', args=[self.asistente.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        data = response.json()
        self.assertEqual(data['nombre'], 'Asistente')
        self.assertEqual(data['apellido'], 'Test')
        self.assertEqual(data['cedula'], '987654321')
        self.assertEqual(data['email'], 'asistente@test.com')
        self.assertEqual(data['cargo'], 'Asistente')
        print("Detalles de empleado verificados correctamente.")