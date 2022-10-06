//LOS ESTADOS VAN AQUI

import 'package:app_doggys/dominio/problemas.dart';
import 'package:app_doggys/dominio/registro_raza.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositorio_verificacion.dart';

class Estado {}

class Creandose extends Estado {}

class SolicitandoNombreRaza extends Estado {}

class EsperandoConfirmacion extends Estado {}

class MostrandoRazaConfirmada extends Estado {
  final RegistroRaza registroRaza;
  final NickFormado nombreRaza;

  MostrandoRazaConfirmada(this.registroRaza, this.nombreRaza);
}

class MostrandoRazaNoConfirmada extends Estado {
  final NickFormado nick;

  MostrandoRazaNoConfirmada(this.nick);
}

class MostrandoRazaSinSubRazas extends Estado {
  final NickFormado nick;

  MostrandoRazaSinSubRazas(this.nick);
}

class MostrandoSolicitudActualizacion extends Estado {}

//LOS EVENTOS VAN AQUI

class Evento {}

class Creado extends Evento {}

class NombreRazaRecibido extends Evento {
  final NickFormado nick;
  NombreRazaRecibido(this.nick);
}

class Verificacion extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  final repositorioVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombreRaza());
    });

    on<NombreRazaRecibido>((event, emit) {
      emit(EsperandoConfirmacion());
      final resultado =
          _repositorioVerificacion.obtenerRegistroRaza(event.nick);
      resultado.match((l) {
        if (l is VersionIncorrectaJSON) emit(MostrandoSolicitudActualizacion());
        if (l is RazaNoEncontrada) emit(MostrandoRazaNoConfirmada(event.nick));
        if (l is SinSubRazas) emit(MostrandoRazaSinSubRazas(event.nick));
      }, (r) {
        emit(MostrandoRazaConfirmada(r, event.nick));
      });
    });
  }
}
