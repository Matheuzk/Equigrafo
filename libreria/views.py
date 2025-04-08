from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.db.models import Sum, F, FloatField
from django.utils.timezone import now, make_aware
from datetime import datetime, timedelta
from django.utils import timezone
from django.core.exceptions import PermissionDenied
import re

from .forms import RegistroForm, LoginForm, camarasForm
from .models import Usuario, camaras_base, Factura, ProductoFactura

def inicio(request): 
    camaras = camaras_base.objects.all()
    search_query = request.GET.get('search')
    mp_range = request.GET.get('mp_range')
    resolution = request.GET.get('resolution')

    if search_query:
        keywords = search_query.split()
        for keyword in keywords:
            camaras = camaras.filter(
                descripcion__icontains=keyword
            ) | camaras.filter(
                titulo__icontains=keyword
            )
    camaras_recomendadas = camaras.order_by('?')[:5]

    if mp_range:
        min_mp, max_mp = mp_range.split('-')
        min_mp = float(min_mp)
        if max_mp == 'max':
            camaras = [camara for camara in camaras if re.search(r'(\d+(\.\d+)?)\s*MP', camara.descripcion) and float(re.search(r'(\d+(\.\d+)?)\s*MP', camara.descripcion).group(1)) >= min_mp]
        else:
            max_mp = float(max_mp)
            camaras = [camara for camara in camaras if re.search(r'(\d+(\.\d+)?)\s*MP', camara.descripcion) and min_mp <= float(re.search(r'(\d+(\.\d+)?)\s*MP', camara.descripcion).group(1)) <= max_mp]

    if resolution == '4K':
        camaras = [camara for camara in camaras if '4K' in camara.descripcion]

    camaras_nikon = [camara for camara in camaras if 'Nikon' in camara.titulo]
    camaras_sony = [camara for camara in camaras if 'Sony' in camara.titulo]
    camaras_canon = [camara for camara in camaras if 'Canon' in camara.titulo]
    camaras_otros = [camara for camara in camaras if 'Nikon' not in camara.titulo and 'Sony' not in camara.titulo and 'Canon' not in camara.titulo]

    context = {
        'camaras_nikon': camaras_nikon,
        'camaras_sony': camaras_sony,
        'camaras_canon': camaras_canon,
        'camaras_otros': camaras_otros,
        'camaras_recomendadas': camaras_recomendadas
    }

    return render(request, 'cliente/inicio.html', context)


def nosotros(request):
    return render(request, 'cliente/nosotros.html')


@login_required
def camaras(request): 
    if request.user.cargo != 'Gerente':
        raise PermissionDenied
    camaras = camaras_base.objects.filter() 
    return render(request, 'camaras/catalogo.html', {'camaras': camaras})


@login_required
def facturar(request):
    camaras = camaras_base.objects.all()

    if request.method == 'POST':
        productos_data = request.POST.get('productos')
        total_pagado = float(request.POST.get('total_pagado', 0))

        if productos_data:
            productos_list = productos_data.split(';')
            total_vendido = 0
            productos_dict = {}

            # Sumar cantidades de productos seleccionados
            for producto_info in productos_list:
                producto_id, cantidad, precio_unitario = producto_info.split(',')
                cantidad = int(cantidad)

                # Verificar si el producto ya está en el diccionario
                if producto_id in productos_dict:
                    productos_dict[producto_id]['cantidad'] += cantidad
                else:
                    producto = camaras_base.objects.get(id=producto_id)
                    productos_dict[producto_id] = {
                        'producto': producto,
                        'cantidad': cantidad,
                        'precio_unitario': float(precio_unitario)
                    }

            # Validación de inventario
            for producto_info in productos_dict.values():
                producto = producto_info['producto']
                if producto.cantidad < producto_info['cantidad']:
                    return JsonResponse({
                        'error': f"La cantidad solicitada de {producto.titulo} supera el inventario disponible. Disponible: {producto.cantidad}, Solicitado: {producto_info['cantidad']}"
                    }, status=400)

            total_vendido = sum(p['cantidad'] * p['precio_unitario'] for p in productos_dict.values())
            restante = total_pagado - total_vendido

            with transaction.atomic():
                # Crear la factura
                factura = Factura.objects.create(
                    empleado=request.user,
                    total_pagado=total_pagado,
                    total_vendido=total_vendido,
                    restante=restante
                )

                # Procesar cada producto en el diccionario y actualizar el inventario
                for producto_info in productos_dict.values():
                    producto = producto_info['producto']
                    cantidad = producto_info['cantidad']
                    precio_unitario = producto_info['precio_unitario']

                    ProductoFactura.objects.create(
                        factura=factura,
                        producto=producto,
                        cantidad=cantidad,
                        precio_unitario=precio_unitario
                    )

                    # Restar la cantidad vendida del inventario
                    producto.cantidad -= cantidad
                    producto.save()

            factura_data = {
                'factura_id': factura.id,
                'total_pagado': factura.total_pagado,
                'total_vendido': factura.total_vendido,
                'restante': factura.restante,
                'productos': [{'titulo': p.producto.titulo, 'cantidad': p.cantidad, 'precio_unitario': p.precio_unitario} for p in ProductoFactura.objects.filter(factura=factura)]
            }

            return JsonResponse(factura_data)

    context = {'camaras': camaras}
    return render(request, 'facturas/facturar.html', context)


@login_required
def detalles_factura(request):
    facturas = Factura.objects.all()
    context = {'facturas': facturas}
    return render(request, 'facturas/detalles_factura.html', context)

@login_required
def productos_factura(request, factura_id):
    productos = ProductoFactura.objects.filter(factura_id=factura_id)
    productos_data = [
        {
            'titulo': producto.producto.titulo,
            'cantidad': producto.cantidad,
            'precio_unitario': producto.precio_unitario
        }
    for producto in productos]
    return JsonResponse({'productos': productos_data})



from django.db.models import Count

@login_required
def estadisticas(request):
    if request.user.cargo != 'Gerente':
        raise PermissionDenied

    # Obtener la hora actual en UTC y convertir a hora local
    utc_now = timezone.now()
    local_now = timezone.localtime(utc_now)  # Convertir a hora local
    hoy = local_now.date()  # Usar la fecha local
    ayer = hoy - timedelta(days=1)
    hace_una_semana = hoy - timedelta(days=7)

    # Convertir fechas a "aware"
    hoy_inicio = make_aware(datetime.combine(hoy, datetime.min.time()))
    hoy_fin = make_aware(datetime.combine(hoy + timedelta(days=1), datetime.min.time()))
    ayer_inicio = make_aware(datetime.combine(ayer, datetime.min.time()))
    hace_una_semana_inicio = make_aware(datetime.combine(hace_una_semana, datetime.min.time()))

    # Ventas y ganancias de hoy
    ventas_hoy = ProductoFactura.objects.filter(factura__fecha__range=[hoy_inicio, hoy_fin]).aggregate(
        total_ventas=Sum(F('precio_unitario') * F('cantidad')),
        total_ganancia=Sum((F('precio_unitario') - F('producto__precio_compra')) * F('cantidad'), output_field=FloatField())
    )

    # Ventas y ganancias de ayer
    ventas_ayer = ProductoFactura.objects.filter(factura__fecha__range=[ayer_inicio, hoy_inicio]).aggregate(
        total_ventas=Sum(F('precio_unitario') * F('cantidad')),
        total_ganancia=Sum((F('precio_unitario') - F('producto__precio_compra')) * F('cantidad'), output_field=FloatField())
    )

    # Ventas y ganancias de la última semana
    ventas_semana = ProductoFactura.objects.filter(factura__fecha__range=[hace_una_semana_inicio, hoy_fin]).aggregate(
        total_ventas=Sum(F('precio_unitario') * F('cantidad')),
        total_ganancia=Sum((F('precio_unitario') - F('producto__precio_compra')) * F('cantidad'), output_field=FloatField())
    )

    # Top 3 cámaras más vendidas
    top_camaras = ProductoFactura.objects.values('producto').annotate(total_vendido=Sum('cantidad')).order_by('-total_vendido')[:3]
    top_camaras_info = []
    for item in top_camaras:
        camara = camaras_base.objects.get(id=item['producto'])
        top_camaras_info.append({
            'titulo': camara.titulo,
            'precio': camara.precio,
            'foto': camara.image.url,
            'total_vendido': item['total_vendido']
        })

    context = {
        'ventas_hoy': ventas_hoy['total_ventas'] or 0,
        'ganancia_hoy': ventas_hoy['total_ganancia'] or 0,
        'ventas_ayer': ventas_ayer['total_ventas'] or 0,
        'ganancia_ayer': ventas_ayer['total_ganancia'] or 0,
        'ventas_semana': ventas_semana['total_ventas'] or 0,
        'ganancia_semana': ventas_semana['total_ganancia'] or 0,
        'top_camaras': top_camaras_info
    }

    return render(request, 'reportes/estadisticas.html', context)

def crear(request): 
    if request.method == 'POST':
        formulario = camarasForm(request.POST or None, request.FILES or None)

        if formulario.is_valid():
            formulario.save()
            return redirect('camaras')
    else:
        formulario = camarasForm()
    
    return render(request, 'camaras/crear.html', {'formulario': formulario})


def editar(request, id):
    camara = camaras_base.objects.get(id=id)
    formulario = camarasForm(request.POST or None, request.FILES or None, instance=camara)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('camaras')
    return render(request, 'camaras/editar.html', {'formulario': formulario})


def eliminar(request, id): 
    camara = camaras_base.objects.get(id=id)
    camara.delete()
    return redirect('camaras')


def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            return redirect('login')
    else:
        form = RegistroForm()
    return render(request, 'personal/registro.html', {'form': form})

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(request, email=email, password=password)
            if user is not None:
                login(request, user)
                return redirect('inicio')
            else:
                form.add_error(None, 'Correo electrónico o contraseña incorrectos')
    else:
        form = LoginForm()
    return render(request, 'personal/login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('login')

@login_required
def empleados(request):
    if request.user.cargo != 'Gerente':
        raise PermissionDenied
    empleados = Usuario.objects.all()
    return render(request, 'reportes/empleados.html', {'empleados': empleados})
from django.http import JsonResponse

@login_required
def empleado_detalles(request, empleado_id):
    if request.user.cargo != 'Gerente':
        raise PermissionDenied
    empleado = Usuario.objects.get(id=empleado_id)
    facturas = Factura.objects.filter(empleado=empleado).values('id', 'total_vendido', 'fecha')
    empleado_data = {
        'nombre': empleado.nombre,
        'apellido': empleado.apellido,
        'cedula': empleado.cedula,
        'direccion': empleado.direccion,
        'celular': empleado.celular,
        'fecha_nacimiento': empleado.fecha_nacimiento.strftime('%d/%m/%Y') if empleado.fecha_nacimiento else '',
        'email': empleado.email,
        'cargo': empleado.cargo,
        'last_login': empleado.last_login.strftime('%d/%m/%Y %H:%M:%S') if empleado.last_login else '',
        'facturas': list(facturas)
    }
    return JsonResponse(empleado_data)

from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.graphics.shapes import Drawing
from reportlab.graphics import renderPDF
from reportlab.lib.units import inch
from reportlab.lib import colors
from reportlab.graphics.barcode import qr
from django.http import HttpResponse
from .models import Factura, ProductoFactura
from django.utils.timezone import localtime

@login_required
def generar_pdf(request, factura_id):
    factura = Factura.objects.get(id=factura_id)
    productos = ProductoFactura.objects.filter(factura_id=factura_id)

    # Crea el PDF
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="factura_{factura.id}.pdf"'

    # Crea un objeto canvas
    pdf = canvas.Canvas(response, pagesize=letter)
    width, height = letter

    # Establece un margen y la línea superior
    margin = 20
    pdf.setStrokeColor(colors.black)
    pdf.setLineWidth(1)
    pdf.line(margin, height - 20, width - margin, height - 20)  # Línea superior del documento

    # Título principal
    pdf.setFont("Helvetica-Bold", 16)
    pdf.drawString(230, height - 50, "TIENDA EQUIGRAFO")

    # Información de la tienda
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 70, "Dirección:")
    pdf.setFont("Helvetica", 12)
    pdf.drawString(110, height - 70, "Calle 12# 60-10, Medellín")

    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 90, "Teléfono:")
    pdf.setFont("Helvetica", 12)
    pdf.drawString(110, height - 90, "3106794916")

    # Información de facturación autorizada ficticia
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 120, "AUTORIZACIÓN:")
    pdf.setFont("Helvetica", 12)
    pdf.drawString(160, height - 120, "RES. DIAN 18764076155241 - 31/07/2024")

    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 140, "Autorizado desde:")
    pdf.setFont("Helvetica", 12)
    pdf.drawString(160, height - 140, "159P-24853 hasta 159P-500000")

    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 160, "Vigencia hasta:")
    pdf.setFont("Helvetica", 12)
    pdf.drawString(140, height - 160, "31/01/2026")

    # Línea divisoria
    pdf.line(margin, height - 180, width - margin, height - 180)  # Línea divisoria bajo la autorización

    # Detalles de la factura
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 200, f"Factura N°: {factura.id}")
    pdf.drawString(50, height - 220, f"Empleado: {factura.empleado.email}")
    pdf.drawString(50, height - 240, f"Fecha: {localtime(factura.fecha).strftime('%d/%m/%Y %H:%M:%S')}")
    pdf.drawString(50, height - 260, f"Total: ${factura.total_vendido}")
    pdf.drawString(50, height - 280, f"Total Pagado: ${factura.total_pagado}")
    pdf.drawString(50, height - 300, f"Restante: ${factura.restante}")

    # Código QR
    qr_data = f"Factura ID: {factura.id}\nEmpleado: {factura.empleado.email}\nFecha: {localtime(factura.fecha).strftime('%d/%m/%Y %H:%M:%S')}\nTotal Pagado: ${factura.total_pagado}\nRestante: ${factura.restante}"
    qr_code = qr.QrCodeWidget(qr_data)
    qr_code_size = 1.5 * inch
    d = Drawing(qr_code_size, qr_code_size)
    d.add(qr_code)
    renderPDF.draw(d, pdf, width - 150, height - 320)  

    # Línea divisoria
    pdf.line(margin, height - 340, width - margin, height - 340)  # Línea antes de los productos

    # Tabla de productos
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, height - 360, "Productos")
    pdf.setFont("Helvetica", 10)
    y = height - 380
    pdf.drawString(50, y, "Descripción")
    pdf.drawString(250, y, "Cantidad")
    pdf.drawString(350, y, "Precio Unitario")
    pdf.drawString(450, y, "Total")

    # Dibujar la tabla de productos
    y -= 20
    pdf.line(margin, y, width - margin, y)  # Línea bajo los títulos de la tabla
    for producto in productos:
        y -= 20
        pdf.drawString(50, y, f"{producto.producto.titulo[:25]}")  # Descripción del producto
        pdf.drawString(250, y, f"{producto.cantidad} und.")  # Cantidad
        pdf.drawString(350, y, f"${producto.precio_unitario}")  # Precio unitario
        pdf.drawString(450, y, f"${producto.cantidad * producto.precio_unitario}")  # Total por producto

    # Línea divisoria después de los productos
    y -= 20
    pdf.line(margin, y, width - margin, y)

    # Resumen de la factura
    y -= 30
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(50, y, "Resumen:")
    pdf.setFont("Helvetica", 10)
    y -= 20
    pdf.drawString(50, y, f"Total productos: {productos.count()}")
    pdf.drawString(200, y, f"Total: ${factura.total_vendido}")
    pdf.drawString(350, y, f"Total pagado: ${factura.total_pagado}")
    pdf.drawString(500, y, f"Restante: ${factura.restante}")

    # Pie de página con una línea superior
    pdf.line(margin, 100, width - margin, 100)  # Línea superior del pie de página
    pdf.setFont("Helvetica-Oblique", 10)
    pdf.drawString(50, 80, "Gracias por su compra en Tienda EquiGrafo")
    pdf.drawString(50, 60, "Visítanos en: www.equigrafo.com")

    # Finalizar el PDF
    pdf.showPage()
    pdf.save()

    return response



