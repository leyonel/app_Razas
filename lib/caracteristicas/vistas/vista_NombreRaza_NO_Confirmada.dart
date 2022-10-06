import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/varibale_dominio.dart';
import '../verificacion/bloc.dart';

class VistaNombreRazaNoConfirmada extends StatelessWidget {
  final NickFormado nombreRazaNoConfirmado;
  const VistaNombreRazaNoConfirmada(this.nombreRazaNoConfirmado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Nombre de perro No Existente: ${nombreRazaNoConfirmado.valor}'),
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
