import 'package:app_doggys/caracteristicas/repositorio_verificacion.dart';
import 'package:app_doggys/caracteristicas/verificacion/bloc.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_NombreRazaConfirmada.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_NombreRaza_NO_Confirmada.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_Raza_Sin_Subrazas.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_cargando.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_solicitando_raza.dart';
import 'package:app_doggys/caracteristicas/vistas/vista_solicitud_actualizacionJson.dart';
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
            if (estado is MostrandoSolicitudActualizacion) {
              return const VistaMostrandoSolicitudActualizacion();
            }

            if (estado is MostrandoRazaConfirmada) {
              return VistaNombreRazaConfirmada(
                  estado.registroRaza, estado.nombreRaza);
            }

            if (estado is MostrandoRazaSinSubRazas) {
              return VistaNombreRazaSinSubRazas(estado.nombreRazaSinSubRazas);
            }

            if (estado is MostrandoRazaNoConfirmada) {
              return VistaNombreRazaNoConfirmada(estado.nombreRazaNoCofirmada);
            }

            if (estado is MostrandoRazaConfirmada) {}
            return const Center(
              child: Text("Regresa!"),
            );
          }),
        )));
  }
}
