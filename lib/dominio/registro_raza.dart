// ignore_for_file: public_member_api_docs, sort_constructors_first
const String mensajeRegistroRazaError = "Registro de raza Incorrecta";

class RegistroRaza {
  late final List mensaje;
  late final String status;

  RegistroRaza._(
    this.mensaje,
    this.status,
  );

  factory RegistroRaza.constructor({
    required List propuestaMensaje,
    required String propuestaStatus,
  }) {
    if (propuestaMensaje == "Breed not found (master breed does not exist)") {
      throw mensajeRegistroRazaError;
    }

    if (propuestaStatus == "error") {
      throw mensajeRegistroRazaError;
    }

    RegistroRaza._(propuestaMensaje, propuestaStatus);

    final resultado = RegistroRaza._(propuestaMensaje, propuestaStatus);

    return resultado;
  }
}
