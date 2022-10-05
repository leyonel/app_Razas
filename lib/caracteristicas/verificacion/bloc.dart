//LOS ESTADOS VAN AQUI

import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Estado {}

class Creandose extends Estado {}

class SolicitandoNombreRaza extends Estado {}

class EsperandoConfirmacion extends Estado {}

class MostrandoRazaConfirmada extends Estado {}

class MostrandoRazaNoConfirmada extends Estado {}

//LOS EVENTOS VAN AQUI

class Evento {}

class Creado extends Evento {}

class NombreRazaRecibido extends Evento {
  final NickFormado nick;
  NombreRazaRecibido(this.nick);
}

class Verificacion extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombreRaza());
    });
  }
}
