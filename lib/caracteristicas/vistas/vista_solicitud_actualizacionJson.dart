import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaMostrandoSolicitudActualizacion extends StatelessWidget {
  const VistaMostrandoSolicitudActualizacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Actualiza tu JSON'),
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
            onPressed: () {
              final elBloc = context.read<BlocVerificacion>();
              elBloc.add(Creado());
            },
            child: const Text('Regresar'),
          ),
        ],
      ),
    );
  }
}
