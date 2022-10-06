import 'package:app_doggys/caracteristicas/repositorio_verificacion.dart';
import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_cargando.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_solicitando_raza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
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
            if (estado is Creandose) {
              return VistaCargando();
            }
            if (estado is SolicitandoNombreRaza) {
              return VistaSolicitandoNombrePerrito();
            }
            return const Center(
              child: Text("Regresa!"),
            );
          }),
        )));
  }
}
