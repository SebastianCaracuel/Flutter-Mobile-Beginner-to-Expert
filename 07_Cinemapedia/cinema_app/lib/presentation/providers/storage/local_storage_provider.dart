//Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:cinema_app/infrastructure/datasources/isar_datasource.dart';
import 'package:cinema_app/infrastructure/repositories/isar_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  //Esto lo que nos permite es tener un provider de Riverpod para tener la instancia
  //LocalStorageRepositoruImpl creada y que se pueda utilizar, que tendrá todos los métodos
  return LocalStorageRepositoryImpl(IsarDatasoruce());
});
