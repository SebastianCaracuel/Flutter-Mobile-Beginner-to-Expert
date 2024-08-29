//? Este es un archivo donde tiene toda la información de nuestros productos

//Importaciones Flutter

//Importaciones nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart';

//Creamos nuesta clase de nuestro producto
class Producto {
  String id;
  String title;
  int price;
  String description;
  String slug;
  int stock;
  List<String> sizes;
  String gender;
  List<String> tags;
  List<String> images;
  User? user;

  Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.slug,
    required this.stock,
    required this.sizes,
    required this.gender,
    required this.tags,
    required this.images,
    required this.user,
  });
}
