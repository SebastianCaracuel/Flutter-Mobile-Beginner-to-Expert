//? Riverpod - Proveedor del Repositorio de Productos

// Importamos las bibliotecas necesarias de Flutter y Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importamos nuestras propias clases y archivos que contienen la lógica de dominio, infraestructura y autenticación
import 'package:teslo_shop_app/features/products/domain/domain.dart';
import 'package:teslo_shop_app/features/products/infraestructure/infraestructure.dart';
import 'package:teslo_shop_app/features/auth/presentation/providers/auth/auth_provider.dart';

// Definimos un proveedor de tipo 'Provider' utilizando Riverpod
// Este proveedor se encarga de proporcionar una instancia de 'ProductsRepository'
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  // Obtenemos el token de acceso del usuario autenticado utilizando 'authProvider'
  // Si no hay usuario autenticado, se asigna una cadena vacía como token
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  // Creamos una instancia de 'ProductsRepositoryImpl' pasando como parámetro una instancia de 'ProductsDatasourceImpl'
  // Le pasamos el 'accessToken' al 'ProductsDatasourceImpl' para manejar la autenticación
  final productsRepository =
      ProductsRepositoryImpl(ProductsDatasourceImpl(accessToken: accessToken));

  // Retornamos la instancia de 'ProductsRepository' que se utilizará en la aplicación
  return productsRepository;
});
