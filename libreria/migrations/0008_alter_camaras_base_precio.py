# Generated by Django 5.1 on 2024-09-26 22:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('libreria', '0007_camaras_base_precio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='camaras_base',
            name='precio',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='Precio'),
        ),
    ]
