import time
from django.test import TestCase
from django.urls import reverse

class PerformanceTests(TestCase):
    def test_inicio_performance(self):
        """
        Prueba de rendimiento para la vista 'inicio'.
        Mide el tiempo de respuesta y asegura que sea menor a 1 segundo.
        """
        
        start_time = time.time()

        response = self.client.get(reverse('inicio')) 

      
        end_time = time.time()


        duration = end_time - start_time


        self.assertEqual(response.status_code, 200)

        self.assertLess(duration, 1, f"La vista 'inicio' tardó demasiado: {duration:.2f} segundos")