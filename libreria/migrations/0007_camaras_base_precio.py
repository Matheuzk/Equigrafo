# Generated by Django 5.1 on 2024-09-26 21:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('libreria', '0006_usuario_celular_alter_usuario_cedula'),
    ]

    operations = [
        migrations.AddField(
            model_name='camaras_base',
            name='precio',
            field=models.DecimalField(decimal_places=2, default=100000, max_digits=10, verbose_name='Precio'),
        ),
    ]
