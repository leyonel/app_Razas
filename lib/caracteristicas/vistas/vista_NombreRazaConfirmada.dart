// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:app_doggys/dominio/registro_raza.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaNombreRazaConfirmada extends StatelessWidget {
  final RegistroRaza registroRaza;
  final NickFormado nombreRaza;
  const VistaNombreRazaConfirmada(this.registroRaza, this.nombreRaza,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Nombre: ${nombreRaza.valor}'),
        Text('SubRazas: ${registroRaza.mensaje}'),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            final elBloc = context.read<BlocVerificacion>();
            elBloc.add(Creado());
          },
          child: const Text('Regresar'),
        ),
      ],
    );
  }
}
