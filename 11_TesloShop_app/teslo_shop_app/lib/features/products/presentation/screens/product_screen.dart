//? Crear, o actualizar los productos

//Importación flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importación Nuestras

class ProductScreen extends ConsumerStatefulWidget {
  //Variables

  //?
  final String productId;

  //Constructor
  const ProductScreen({super.key, required this.productId});

  @override
  ProductScreenState createState() => ProductScreenState();
}

//Objeto
class ProductScreenState extends ConsumerState<ProductScreen> {
  //Variables

  @override
  Widget build(BuildContext context) {
    //!Widget padre
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar producto'),
        ),
        body: Center(
          child: Text(widget.productId),
        ));
  }
}
