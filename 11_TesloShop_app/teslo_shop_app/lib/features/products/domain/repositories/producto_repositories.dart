// Importamos el archivo 'productos.dart' desde la carpeta 'entities'
// Este archivo probablemente contiene la definición de la clase 'Producto'
import '../entities/productos.dart';

// Definimos una clase abstracta llamada 'ProductsDatasource'
// Esta clase actúa como una interfaz para las operaciones relacionadas con productos en una fuente de datos
abstract class ProductsRepository {
  // Método abstracto que obtiene una lista de productos paginados
  // 'limit' establece la cantidad máxima de productos a devolver (valor por defecto es 10)
  // 'offset' define el desplazamiento desde el primer producto, útil para la paginación (valor por defecto es 0)
  Future<List<Producto>> getProductsByPage({int limit = 10, int offset = 0});

  // Método abstracto que obtiene un producto basado en su ID
  // 'id' es un parámetro requerido que identifica de manera única al producto
  Future<Producto> getProductsById({String id});

  // Método abstracto que busca productos basados en un término de búsqueda
  // 'term' es el texto o palabra clave que se utilizará para buscar productos
  Future<List<Producto>> searchProducByTerm(String term);

  // Método abstracto que crea o actualiza un producto en la fuente de datos
  // 'productLike' es un mapa que contiene las propiedades del producto que se va a crear o actualizar
  Future<Producto> createUpdateProduct(Map<String, dynamic> productLike);
}
