import 'dart:convert';
import 'package:app_doggys/dominio/problemas.dart';
import 'package:app_doggys/dominio/registro_raza.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:fpdart/fpdart.dart';

abstract class repositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick);
}

List campos = ['status', 'message'];

class RepositorioPruebasVerificacion extends repositorioVerificacion {
  final String _hound =
      """{"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"} """;

  final String _husky = """{"message":[],"status":"success"} """;

  final String _pez =
      """{"status":"error","message":"Breed not found (master breed does not exist)","code":404} """;

  final String _incorrecto =
      """{"messssage":["afghan","basset","blood","english","ibizan","plott","walker"],"stttatus":"success"} """;

  @override
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick) {
    if (nick.valor == 'hound') {
      return obtenerRegistroUsuarioDesdeJSON(_hound);
    }

    if (nick.valor == 'husky') {
      return obtenerRegistroUsuarioDesdeJSON(_husky);
    }

    if (nick.valor == 'pez') {
      return obtenerRegistroUsuarioDesdeJSON(_pez);
    }

    if (nick.valor == 'incorrecto') {
      return Left(VersionIncorrectaJSON());
    }

    return Left(RazaNoEncontrada());
  }
}

Either<Problema, RegistroRaza> obtenerRegistroUsuarioDesdeJSON(
    String docuemnto) {
  Map<String, dynamic> resultado = jsonDecode(docuemnto);

  if (resultado['status'] == "error") {
    return left(RazaNoEncontrada());
  }

  if (resultado['message'].isEmpty) {
    return left(SinSubRazas());
  }

  return Right(RegistroRaza.constructor(
      propuestaMensaje: resultado['message'],
      propuestaStatus: resultado['status']));
}
