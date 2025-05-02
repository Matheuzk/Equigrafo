from django.test import TestCase
from django.urls import reverse
from ..models import Usuario
from .utils import log_test_info  # Importa el decorador

class UsuarioModelTest(TestCase):

    def setUp(self):
        print("Configurando el entorno de prueba para UsuarioModelTest...")
        self.usuario = Usuario.objects.create(
            email='test@ejemplo.com',
            username='testuser',
            nombre='Test',
            apellido='User',
            cedula='1234567890',
            cargo='Gerente'
        )
        print("Usuario de prueba creado con éxito.")

    @log_test_info
    def test_usuario_creation(self):
        """Prueba la creación de un usuario y verifica sus atributos."""
        print("Verificando atributos del usuario...")
        self.assertEqual(self.usuario.email, 'test@ejemplo.com')
        self.assertEqual(self.usuario.username, 'testuser')
        self.assertEqual(self.usuario.nombre, 'Test')
        self.assertEqual(self.usuario.apellido, 'User')
        self.assertEqual(self.usuario.cedula, '1234567890')
        self.assertEqual(self.usuario.cargo, 'Gerente')
        print("Todos los atributos del usuario son correctos.")

class RegistroViewTest(TestCase):

    @log_test_info
    def test_registro_view(self):
        """Prueba la vista de registro y verifica que se cree un nuevo usuario."""
        print("Enviando datos al endpoint de registro...")
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
        print("Verificando el estado de la respuesta...")
        self.assertEqual(response.status_code, 302)  # Redireccionamiento
        print("Estado de respuesta correcto (302).")
        print("Verificando que el usuario se haya creado en la base de datos...")
        self.assertTrue(Usuario.objects.filter(email='newuser@ejemplo.com').exists())
        print("El usuario se creó correctamente en la base de datos.")