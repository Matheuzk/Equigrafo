# Generated by Django 5.1 on 2024-10-11 14:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('libreria', '0010_remove_usuario_cargo'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='cargo',
            field=models.CharField(blank=True, choices=[('Gerente', 'Gerente'), ('Asistente', 'Asistente'), ('Cajero', 'Cajero'), ('Atención al cliente', 'Atención al cliente')], max_length=50, null=True),
        ),
    ]
