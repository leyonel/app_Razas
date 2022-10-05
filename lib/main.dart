import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'caracteristicas/repositorio_verificacion.dart';
import 'caracteristicas/verificacion/bloc.dart';

void main() {
  runApp(const MiAplicacionCanina());
}

class MiAplicacionCanina extends StatelessWidget {
  const MiAplicacionCanina({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion =
            BlocVerificacion(RepositorioPruebasVerificacion());
        Future.delayed(Duration(seconds: 1));
        return blocVerificacion;
      },
      child: Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplicacion',
        home: Scaffold(body: Builder(
          builder: ((context) {
            var estado = context.watch<BlocVerificacion>().state;
            return const Center(
              child: Text("Regresa!"),
            );
          }),
        )));
  }
}
