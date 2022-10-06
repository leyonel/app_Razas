import 'package:app_doggys/caracteristicas/repositorio_verificacion.dart';
import 'package:app_doggys/dominio/problemas.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas Verificacion Offline', () {
    test('Con Hound me regresa valor con subrazas', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroRaza(NickFormado.constructor('hound'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(
            r.mensaje,
            equals([
              "afghan",
              "basset",
              "blood",
              "english",
              "ibizan",
              "plott",
              "walker"
            ]));
        expect(r.status, equals('success'));
      });
    });

    test('Con Husky me regresa valor sin subrazas', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroRaza(NickFormado.constructor('husky'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.mensaje, equals([]));
        expect(r.status, equals('success'));
      });
    });

    test('Con pez me regresa de estado error', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroRaza(NickFormado.constructor('pez'));
      resultado.match((l) {
        expect(false, equals(false));
      }, (r) {
        expect(
            r.mensaje, equals("Breed not found (master breed does not exist)"));
        expect(r.status, equals('error'));
      });
    });

    test('Con incorrecto me regresa de json incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroRaza(NickFormado.constructor('incorrecto'));
      resultado.match((l) {
        expect(l, isA<VersionIncorrectaJSON>());
      }, (r) {
        assert(false);
      });
    });
  });
}
