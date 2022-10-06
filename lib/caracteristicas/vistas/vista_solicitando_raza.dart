import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/varibale_dominio.dart';

class VistaSolicitandoNombrePerrito extends StatefulWidget {
  const VistaSolicitandoNombrePerrito({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoNombrePerrito> createState() =>
      _VistaSolicitandoNombrePerritoState();
}

class _VistaSolicitandoNombrePerritoState
    extends State<VistaSolicitandoNombrePerrito> {
  bool _nombreRazaValidado = false;
  late final TextEditingController controlador;

  @override
  void initState() {
    controlador = TextEditingController();
    controlador.addListener(escuchadorValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controlador.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elBloc = context.read<BlocVerificacion>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter',
            ),
            controller: controlador,
          ),
          Container(
            child: _nombreRazaValidado
                ? null
                : TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: null,
                    child: const Text('Buscar Perrito'),
                  ),
          ),
          Container(
            child: !_nombreRazaValidado
                ? null
                : TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      elBloc.add(
                        NombreRazaRecibido(
                          NickFormado.constructor(controlador.text),
                        ),
                      );
                    },
                    child: const Text('Buscar Perrito'),
                  ),
          ),
          Container(
            child: Text(controlador.text),
          )
        ],
      ),
    );
  }

  void escuchadorValidador() {
    setState(() {
      try {
        NickFormado.constructor(controlador.text);
        _nombreRazaValidado = true;
      } catch (e) {
        _nombreRazaValidado = false;
      }
    });
  }
}
