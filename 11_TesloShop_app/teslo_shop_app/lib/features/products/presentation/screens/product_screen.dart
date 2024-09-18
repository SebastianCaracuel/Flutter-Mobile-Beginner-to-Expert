//? Crear, o actualizar los productos

//Importación flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop_app/features/products/presentation/providers/providers.dart';
import 'package:teslo_shop_app/features/shared/shared.dart';

//Importación Nuestras

class ProductScreen extends ConsumerWidget {
  //parametro
  final String productId;

  //Constructor
  const ProductScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, ref) {
    //parametros del objeto
    final productState = ref.watch(productProvider(productId));

    //!Widget padre
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: const FullScreenLoader(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.save_alt_outlined)),
    );
  }
}
