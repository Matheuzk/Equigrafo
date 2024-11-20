from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class camaras_base(models.Model):
    
    id = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=100, verbose_name='Titulo')
    image = models.ImageField(upload_to='imagenes/', verbose_name="Imagen", null=True)
    descripcion = models.TextField(verbose_name="Descripcion", null=True)
    cantidad = models.IntegerField(default=0, verbose_name="Cantidad")
    precio = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Precio de Venta")
    precio_compra = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Valor comprado", null=True)
    def __str__(self):
        fila = "Titulo: " + self.titulo + " Descripcion: " + self.descripcion
        return fila

    def delete(self, using=None, keep_parents=False):
        self.image.storage.delete(self.image.name)
        super().delete()

class UsuarioManager(BaseUserManager):
    
    def create_user(self, email, username, password=None, **extra_fields):
        if not email:
            raise ValueError('El usuario debe tener un correo electrónico')
        user = self.model(
            email=self.normalize_email(email),
            username=username,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, password, **extra_fields):
        extra_fields.setdefault('is_admin', True)
        return self.create_user(email, username, password, **extra_fields)

class Usuario(AbstractBaseUser):
    CARGOS_CHOICES = [
        ('Gerente', 'Gerente'),
        ('Asistente', 'Asistente'),
        ('Cajero', 'Cajero'),
        ('Atención al cliente', 'Atención al cliente')
    ]
    
    email = models.EmailField(verbose_name='Correo electrónico', max_length=255, unique=True)
    username = models.CharField(max_length=255, unique=True)
    nombre = models.CharField(max_length=255, blank=True, null=True)
    apellido = models.CharField(max_length=255, blank=True, null=True)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    celular = models.CharField(max_length=20, blank=True, null=True)
    fecha_nacimiento = models.DateField(blank=True, null=True)
    cedula = models.CharField(max_length=20, unique=True)
    cargo = models.CharField(max_length=50, choices=CARGOS_CHOICES) 
    
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = UsuarioManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin

class Factura(models.Model):
    empleado = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='facturas')  # Empleado que realiza la venta
    fecha = models.DateTimeField(auto_now_add=True)  # Fecha de creación de la factura
    total_pagado = models.DecimalField(max_digits=12, decimal_places=2)  # Monto pagado por el cliente
    total_vendido = models.DecimalField(max_digits=12, decimal_places=2)  # Total de lo vendido (suma de los productos)
    restante = models.DecimalField(max_digits=10, decimal_places=2)  # Diferencia entre lo pagado y el total de la venta
    productos = models.ManyToManyField(camaras_base, through='ProductoFactura', related_name='facturas')  # Relación con productos

    def __str__(self):
        return f"Factura #{self.id} - Empleado: {self.empleado.email} - Total: {self.total_vendido} - Pagado: {self.total_pagado}"

class ProductoFactura(models.Model):
    factura = models.ForeignKey(Factura, on_delete=models.CASCADE)  # Factura a la que está asociado el producto
    producto = models.ForeignKey(camaras_base, on_delete=models.CASCADE)  # Producto vendido
    cantidad = models.PositiveIntegerField()  # Cantidad de productos vendidos
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)  # Precio unitario del producto

    def __str__(self):
        return f"{self.cantidad} x {self.producto.titulo} (Factura #{self.factura.id})"
