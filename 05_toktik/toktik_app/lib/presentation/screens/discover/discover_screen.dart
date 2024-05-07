import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_app/presentation/providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Creamos una variable
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
        //Creamos una condición -
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                //Cambiamos el Grosor de la linea
                strokeWidth: 2,
              ))
            //Aquí irán los videos
            : const Placeholder());
  }
}
