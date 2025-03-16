from django.test import TestCase
from django.urls import reverse
from .models import Usuario

class UsuarioModelTest(TestCase):

    def setUp(self):
        self.usuario = Usuario.objects.create(
            email='test@ejemplo.com',
            username='testuser',
            nombre='Test',
            apellido='User',
            cedula='1234567890',
            cargo='Gerente'
        )

    def test_usuario_creation(self):
        self.assertEqual(self.usuario.email, 'test@ejemplo.com')
        self.assertEqual(self.usuario.username, 'testuser')
        self.assertEqual(self.usuario.nombre, 'Test')
        self.assertEqual(self.usuario.apellido, 'User')
        self.assertEqual(self.usuario.cedula, '1234567890')
        self.assertEqual(self.usuario.cargo, 'Gerente')

class RegistroViewTest(TestCase):

    def test_registro_view(self):
        response = self.client.post(reverse('registro'), {
            'email': 'newuser@ejemplo.com',
            'username': 'newuser',
            'password': 'password123',
            'nombre': 'New',
            'apellido': 'User',
            'tipo_calle': 'Calle',
            'numero_tipo_calle': '123',
            'numero_calle': '45',     
            'celular': '1234567890',
            'fecha_nacimiento': '2000-01-01',
            'cedula': '9876543210',
            'pin': '10012'
        })
        self.assertEqual(response.status_code, 302)  # Redireccionamiento
        self.assertTrue(Usuario.objects.filter(email='newuser@ejemplo.com').exists())