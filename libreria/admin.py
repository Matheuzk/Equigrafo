from django.contrib import admin
from django.urls import reverse
from django.utils.html import format_html
from .models import camaras_base, Usuario, Factura, ProductoFactura

class CamarasBaseAdmin(admin.ModelAdmin):
    search_fields = ['titulo', 'descripcion']
    list_filter = ['precio', 'cantidad']
    list_display = ['titulo', 'descripcion', 'precio', 'cantidad', 'view_facturas_link']

    def view_facturas_link(self, obj):
        url = reverse('admin:libreria_factura_changelist') + f'?productos__id__exact={obj.id}'
        return format_html('<a href="{}">Ver Facturas</a>', url)
    view_facturas_link.short_description = 'Facturas'

class UsuarioAdmin(admin.ModelAdmin):
    search_fields = ['username', 'email']
    list_filter = ['cargo']
    list_display = ['username', 'email', 'cargo', 'view_facturas_link']

    def view_facturas_link(self, obj):
        url = reverse('admin:libreria_factura_changelist') + f'?empleado__id__exact={obj.id}'
        return format_html('<a href="{}">Ver Facturas</a>', url)
    view_facturas_link.short_description = 'Facturas'

class FacturaAdmin(admin.ModelAdmin):
    search_fields = ['empleado__email', 'empleado__username']
    list_filter = ['empleado']
    list_display = ['empleado', 'fecha', 'total_pagado', 'total_vendido', 'restante', 'view_productos_link']

    def view_productos_link(self, obj):
        url = reverse('admin:libreria_productofactura_changelist') + f'?factura__id__exact={obj.id}'
        return format_html('<a href="{}">Ver Productos</a>', url)
    view_productos_link.short_description = 'Productos'

class ProductoFacturaAdmin(admin.ModelAdmin):
    search_fields = ['producto__titulo']
    list_filter = ['producto']
    list_display = ['factura', 'producto_titulo', 'cantidad', 'precio_unitario', 'view_factura_link']

    def producto_titulo(self, obj):
        return obj.producto.titulo
    producto_titulo.short_description = 'Producto'

    def view_factura_link(self, obj):
        url = reverse('admin:libreria_factura_change', args=[obj.factura.id])
        return format_html('<a href="{}">Editar Factura</a>', url)
    view_factura_link.short_description = 'Factura'


admin.site.register(camaras_base, CamarasBaseAdmin)
admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Factura, FacturaAdmin)
admin.site.register(ProductoFactura, ProductoFacturaAdmin)

admin.site.index_title = "Bienvenido al Panel de Administración de EquiGrafo"