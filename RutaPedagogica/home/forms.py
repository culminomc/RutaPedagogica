from django.template.defaultfilters import filesizeformat

from wagtail.documents.forms import BaseDocumentForm

from home.uploads import get_max_upload_bytes, get_max_upload_legible, validar_archivo


class DocumentoForm(BaseDocumentForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        campo = self.fields.get("file")
        if campo is None:
            return
        max_bytes = get_max_upload_bytes()
        if hasattr(campo, "max_upload_size"):
            campo.max_upload_size = max_bytes
            campo.max_upload_size_text = filesizeformat(max_bytes)
        extra = f" Videos: máximo {get_max_upload_legible()} (configurable en Ajustes de carga y videos)."
        campo.help_text = ((campo.help_text or "") + extra).strip()

    def clean_file(self):
        archivo = self.cleaned_data.get("file")
        error = validar_archivo(archivo)
        if error:
            from django.core.exceptions import ValidationError

            raise ValidationError(error)
        return archivo
