import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_app/presentation/providers/discover_provider.dart';

//Creamos un widget que será nuestro "Home"
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Referencia  a nuestro provider
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body:
          //Condición - si el discoverProvider initialoading esta en true voy a mostrar el circularprogress

          discoverProvider.initialLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      //Cambiamos el grosor de la linea de Carga
                      strokeWidth: 2))
              //Aquí irá nuestro VideoPLayer
              : const Placeholder(),
    );
  }
}
