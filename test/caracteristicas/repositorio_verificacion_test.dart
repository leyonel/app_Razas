import 'package:app_doggys/caracteristicas/repositorio_verificacion.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas Verificacion Offline', () {
    test('Con Hound me regresa valor', () {
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
  });
}
