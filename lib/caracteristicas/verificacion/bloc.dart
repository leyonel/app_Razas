//LOS ESTADOS VAN AQUI

import 'package:flutter_bloc/flutter_bloc.dart';

class Estado {}

class Creandose extends Estado {}

class SolicitandoRaza extends Estado {}

class EsperandoConfirmacion extends Estado {}

class MostrandoRazaConfirmada extends Estado {}

class MostrandoRazaNoConfirmada extends Estado {}

//LOS EVENTOS VAN AQUI

class Evento {}

class Creado extends Evento {}

class NombreRazaRecibido extends Evento {}

class Verificacion extends Evento {}
