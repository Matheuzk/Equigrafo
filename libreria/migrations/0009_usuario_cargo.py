# Generated by Django 5.1 on 2024-10-11 13:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('libreria', '0008_alter_camaras_base_precio'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='cargo',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
