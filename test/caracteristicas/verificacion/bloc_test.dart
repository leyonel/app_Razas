import 'package:app_doggys/caracteristicas/repositorio_verificacion.dart';
import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:app_doggys/dominio/problemas.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<BlocVerificacion, Estado>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoNombreRaza>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'Cuando Nombre recibido sea Hound debe de tener mostrando nombre confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRazaRecibido(NickFormado.constructor('hound'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaConfirmada>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es Husky debo de tener Mostando nombre confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRazaRecibido(NickFormado.constructor('husky'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaSinSubRazas>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es pez debo de tener Mostando nombre no confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) => bloc.add(NombreRazaRecibido(NickFormado.constructor('pez'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaNoConfirmada>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es incorrecto debo de tener Version Incorrecta Json',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRazaRecibido(NickFormado.constructor('incorrecto'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoSolicitudActualizacion>()],
  );
}
