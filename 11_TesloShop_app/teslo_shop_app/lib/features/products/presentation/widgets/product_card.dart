//Importaciones FLutter
import 'package:flutter/material.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';

//Importaciones nuestras

class ProductCard extends StatelessWidget {
  //Llamamos a nuestra entidad del producto
  final Producto product;

  //Propiedad
  const ProductCard({
    super.key,
    required this.product,
  });

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedad objeto

    //!Widget Padre
    return Column(
      children: [
        _ImageViewer(
          images: product.images,
        ),

        //? Colocamos el titulo del producto
        Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

//todo:Imagen
class _ImageViewer extends StatelessWidget {
  //La lista de los porductos o la lista de la imagen
  final List<String> images;

  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
        fit: BoxFit.cover,
        height: 250,
        fadeOutDuration: const Duration(milliseconds: 100),
        fadeInDuration: const Duration(milliseconds: 200),
        image: NetworkImage(images.first),
        placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
      ),
    );
  }
}
