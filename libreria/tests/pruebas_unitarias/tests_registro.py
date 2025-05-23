from django.test import TestCase
from django.urls import reverse
from ...models import Usuario
 

class PruebaRegistroUsuario(TestCase):
    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        
        print("\n=== Prueba: Registro de Usuario ===")

    def setUp(self):
        
        self.usuario = Usuario.objects.create(
            email='testuser@example.com', 
            username='testuser',
            nombre='Test',
            apellido='User',
            cedula='1234567890',
            cargo='Gerente'
        )

    def test_creacion_usuario(self):

        print("Verificando atributos del usuario creado...")

        self.assertEqual(self.usuario.email, 'testuser@example.com')
        self.assertEqual(self.usuario.username, 'testuser')
        self.assertEqual(self.usuario.nombre, 'Test')
        self.assertEqual(self.usuario.apellido, 'User')
        self.assertEqual(self.usuario.cedula, '1234567890')
        self.assertEqual(self.usuario.cargo, 'Gerente')

        print("Prueba de creación de usuario completada exitosamente.")

    def test_registro_usuario(self):
        
        print("\n=== Prueba: Vista de Registro de Usuario ===")

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

        
        self.assertEqual(response.status_code, 302)
        print("Estado de respuesta correcto (302).")

       
        self.assertTrue(Usuario.objects.filter(email='newuser@ejemplo.com').exists())

        print("Prueba de registro completada exitosamente.")