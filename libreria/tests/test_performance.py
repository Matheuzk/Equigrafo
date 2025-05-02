import time
from django.test import TestCase
from django.urls import reverse

class PerformanceTests(TestCase):
    def test_inicio_performance(self):
        """
        Prueba de rendimiento para la vista 'inicio'.
        Mide el tiempo de respuesta y asegura que sea menor a 1 segundo.
        """
        # Registrar el tiempo inicial
        start_time = time.time()

        # Realizar la solicitud GET a la vista 'inicio'
        response = self.client.get(reverse('inicio'))  # Cambia 'inicio' por el nombre de tu URL

        # Registrar el tiempo final
        end_time = time.time()

        # Calcular la duración
        duration = end_time - start_time

        # Verificar que la respuesta sea exitosa (código 200)
        self.assertEqual(response.status_code, 200)

        # Verificar que el tiempo de respuesta sea menor a 1 segundo
        self.assertLess(duration, 1, f"La vista 'inicio' tardó demasiado: {duration:.2f} segundos")