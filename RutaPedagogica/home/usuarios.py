from django import forms
from wagtail.users.forms import UserCreationForm, UserEditForm
from wagtail.users.views.users import UserViewSet

from home.permisos import aplicar_perfil, asegurar_grupos, perfil_de


PERFIL_CHOICES = [
    ("administrador", "Administrador — crea cuentas y administra todo el sitio"),
    ("carga", "Carga — sube y publica páginas, imágenes y videos"),
    ("visor", "Visor — solo consulta, no puede modificar"),
]


class _PerfilMixin:
    def __init__(self, *args, **kwargs):
        asegurar_grupos()
        super().__init__(*args, **kwargs)
        self.fields.pop("groups", None)
        self.fields.pop("is_superuser", None)
        if "first_name" in self.fields:
            self.fields["first_name"].required = False
        if "last_name" in self.fields:
            self.fields["last_name"].required = False
        if "email" in self.fields:
            self.fields["email"].required = False
        self.fields["perfil"] = forms.ChoiceField(
            label="Perfil",
            choices=PERFIL_CHOICES,
            initial=perfil_de(self.instance) or "carga",
            help_text="Administrador gestiona cuentas. Carga publica contenido. Visor solo mira.",
        )

    def save(self, commit=True):
        user = super().save(commit=False)
        perfil = self.cleaned_data.get("perfil") or "carga"
        user.is_staff = True
        user.is_superuser = perfil == "administrador"
        if commit:
            user.save()
            self.save_m2m()
            aplicar_perfil(user, perfil)
        return user


class PerfilUserCreationForm(_PerfilMixin, UserCreationForm):
    pass


class PerfilUserEditForm(_PerfilMixin, UserEditForm):
    pass


class PerfilUserViewSet(UserViewSet):
    def get_form_class(self, for_update=False):
        if for_update:
            return PerfilUserEditForm
        return PerfilUserCreationForm


def registrar_perfiles():
    from django.apps import apps

    apps.get_app_config("wagtailusers").user_viewset = "home.usuarios.PerfilUserViewSet"
