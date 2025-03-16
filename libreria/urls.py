from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('', views.inicio, name='inicio'),
    
    path('nosotros', views.nosotros, name='nosotros'),
    
    path('camaras', views.camaras, name='camaras'),
    
    path('camaras/crear', views.crear, name='crear'),
    
    path('camaras/editar/<int:id>', views.editar, name='editar'),
    
    path('eliminar/<int:id>', views.eliminar, name='eliminar'),
    
    path('registro/', views.registro, name='registro'),
    
    path('login/', views.login_view, name='login'),
    
    path('logout/', views.logout_view, name='logout'),
    
    path('facturar/', views.facturar, name='facturar'),
    
    path('estadisticas/', views.estadisticas, name='estadisticas'),

    path('empleados/', views.empleados, name='empleados'),
    
    path('empleado/<int:empleado_id>/detalles/', views.empleado_detalles, name='empleado_detalles'),
    
    path('detalles_factura/', views.detalles_factura, name='detalles_factura'),
    
    path('factura/<int:factura_id>/productos/', views.productos_factura, name='productos_factura'),
    
    path('factura/<int:factura_id>/pdf/', views.generar_pdf, name='generar_pdf'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)