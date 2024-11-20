from django import forms
from .models import camaras_base

class camarasForm(forms.ModelForm):
    class Meta:
        model = camaras_base
        fields = '__all__'
        
from django import forms
from .models import Usuario

TIPOS_DE_CALLE = [
    ('Calle', 'Calle'),
    ('Carrera', 'Carrera'),
    ('Avenida', 'Avenida'),
    ('Diagonal', 'Diagonal'),
    ('Transversal', 'Transversal'),
]

class RegistroForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    fecha_nacimiento = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    celular = forms.CharField(widget=forms.TextInput(attrs={'type': 'tel', 'pattern': '[0-9]+'}))
    cedula = forms.CharField(widget=forms.TextInput(attrs={'pattern': '[0-9]+'}))
    
    tipo_calle = forms.ChoiceField(choices=TIPOS_DE_CALLE, required=True)
    numero_tipo_calle = forms.CharField(max_length=10, required=True)
    numero_calle = forms.CharField(max_length=10, required=True)
    pin = forms.CharField(max_length=5, required=True, label='PIN')
    
    class Meta:
        model = Usuario
        fields = ['email', 'username', 'password', 'nombre', 'apellido', 'tipo_calle', 'numero_tipo_calle', 'numero_calle', 'celular', 'fecha_nacimiento', 'cedula', 'pin']
        
    def clean_pin(self):
        pin = self.cleaned_data['pin']
        cargos_por_pin = {
            
            '10012': 'Gerente',
            '10013': 'Asistente',
            '10014': 'Cajero',
            '10015': 'Atención al cliente'
        }
        if pin not in cargos_por_pin:
            raise forms.ValidationError('PIN inválido. Intenta con otro.')
        return cargos_por_pin[pin]
    
    def clean(self):
        cleaned_data = super().clean()
        tipo_calle = cleaned_data.get('tipo_calle')
        numero_tipo_calle = cleaned_data.get('numero_tipo_calle')
        numero_calle = cleaned_data.get('numero_calle')
        
        direccion = f"{tipo_calle} {numero_tipo_calle} # {numero_calle}"
        
        cleaned_data['direccion'] = direccion
        
        return cleaned_data

    def save(self, commit=True):
        user = super().save(commit=False)
        user.direccion = self.cleaned_data['direccion']
        user.cargo = self.cleaned_data['pin'] 
        if commit:
            user.save()
        return user
        
class LoginForm(forms.Form):
    email = forms.EmailField(label='Correo electrónico')
    password = forms.CharField(label='Contraseña', widget=forms.PasswordInput)