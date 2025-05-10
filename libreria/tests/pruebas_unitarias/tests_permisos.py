from django.test import TestCase, Client
from django.urls import reverse
from libreria.models import Usuario

class PermisosAccesoViewsTest(TestCase):
    def setUp(self):

        print("\n=== Prueba: Permisos de Acceso a Vistas Protegidas ===")

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

    def test_acceso_empleados_como_gerente(self):
        print("Intentando acceder a empleados como Gerente...")
        self.client.login(email='gerente@test.com', password='testpass123')
        response = self.client.get(reverse('empleados'))
        self.assertEqual(response.status_code, 200)
        print("Acceso permitido para Gerente.")
        

    def test_acceso_empleados_como_asistente(self):
        print("Intentando acceder a empleados como Asistente...")
        self.client.login(email='asistente@test.com', password='testpass123')
        response = self.client.get(reverse('empleados'))
        
        self.assertIn(response.status_code, [302, 403])
        print("Acceso denegado para Asistente correctamente.")