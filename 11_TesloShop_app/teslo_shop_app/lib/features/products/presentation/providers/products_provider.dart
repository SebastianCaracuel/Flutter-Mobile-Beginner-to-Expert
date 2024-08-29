// Importamos las definiciones del dominio, que probablemente incluye la clase 'Producto'
import 'package:teslo_shop_app/features/products/domain/domain.dart';

// Clase que define el estado de los productos en el proveedor
class ProductsState {
  // Indica si la página actual es la última página de productos
  final bool isLastPage;

  // Número máximo de productos que se pueden obtener en una sola carga
  final int limit;

  // Desplazamiento desde el primer producto, utilizado para la paginación
  final int offset;

  // Indica si se está cargando la lista de productos actualmente
  final bool isLoading;

  // Lista de productos actualmente cargados
  final List<Producto> products;

  // Constructor de la clase 'ProductsState'
  // Establece valores predeterminados para cada propiedad
  ProductsState({
    this.isLastPage = false, // Por defecto, no es la última página
    this.limit = 10, // Límite predeterminado de 10 productos
    this.offset = 0, // Desplazamiento predeterminado de 0
    this.isLoading = false, // Por defecto, no está cargando
    this.products = const [], // Lista vacía de productos por defecto
  });

  // Método 'copyWith' para crear una nueva instancia de 'ProductsState'
  // Permite copiar el estado existente y sobrescribir propiedades específicas
  ProductsState copyWith(
    bool? isLastPage, // Permite cambiar si es la última página
    int? limit, // Permite cambiar el límite de productos
    int? offset, // Permite cambiar el desplazamiento
    bool? isLoading, // Permite cambiar el estado de carga
    List<Producto>? products, // Permite cambiar la lista de productos
  ) =>
      // Retorna una nueva instancia de 'ProductsState' con las propiedades
      // sobrescritas o los valores actuales si no se proporcionan nuevos valores
      ProductsState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
      );
}
