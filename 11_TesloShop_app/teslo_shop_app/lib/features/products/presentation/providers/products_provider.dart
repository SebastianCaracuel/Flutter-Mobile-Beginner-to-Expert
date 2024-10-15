// Importamos las definiciones del dominio, que probablemente incluye la clase 'Producto'
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';
import 'products_repository_provider.dart';

//todo: Definimos un proveedor de estado utilizando 'StateNotifierProvider'
// 'ProductsNotifier' es el gestor de estado y 'ProductsState' es el tipo de estado que gestiona
final productsProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  // Obtenemos una instancia de 'ProductsRepository' utilizando el 'productsRepositoryProvider'
  final productsRepository = ref.watch(productsRepositoryProvider);

  // Retornamos una instancia de 'ProductsNotifier' inicializada con el 'productsRepository'
  return ProductsNotifier(productsRepository: productsRepository);
});

//todo: Definimos la clase 'ProductsNotifier', que extiende 'StateNotifier' con un estado de tipo 'ProductsState'
class ProductsNotifier extends StateNotifier<ProductsState> {
  // Dependencia del repositorio de productos, que se utilizará para interactuar con los datos de los productos
  final ProductsRepository productsRepository;

  // Constructor para 'ProductsNotifier'
  // Requiere una instancia de 'ProductsRepository' para inicializarse
  // Llama al constructor de la superclase 'StateNotifier' con un estado inicial de 'ProductsState'
  // Además, invoca el método 'loadNextPage()' para cargar la primera página de productos
  ProductsNotifier({required this.productsRepository})
      : super(ProductsState()) {
    loadNextPage();
  }

  //Actualizar el producto
  Future<bool> createOrUpdateProduct(Map<String, dynamic> productLike) async {
    try {
      //realizamos la actualización
      final product = await productsRepository.createUpdateProduct(productLike);

      //si el producto existe en la lista
      final isProductInList =
          state.products.any((element) => element.id == product.id);
      //si el producto no existe
      if (!isProductInList) {
        state = state.copyWith(products: [...state.products, product]);
        return true;
      }

      //Si el producto existe, voy a actualizarlo
      state = state.copyWith(
          products: state.products
              .map(
                (element) => (element.id == product.id) ? product : element,
              )
              .toList());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Método asíncrono que carga la siguiente página de productos
  Future loadNextPage() async {
    // Si ya se está cargando o si es la última página, no se hace nada
    if (state.isLoading || state.isLastPage) return;

    // Actualiza el estado para indicar que se está cargando
    state = state.copyWith(
      isLoading: true,
    );

    // Llama al repositorio para obtener la siguiente página de productos
    final products = await productsRepository.getProductsByPage(
        limit: state.limit, offset: state.offset);

    // Si no se obtuvieron productos, se marca como la última página y se detiene la carga
    if (products.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isLastPage: true,
      );
      return;
    }

    // Si se obtuvieron productos, actualiza el estado con los nuevos productos,
    // desactiva el indicador de carga, actualiza el offset, y marca que no es la última página
    state = state.copyWith(
        isLastPage: false,
        isLoading: false,
        offset: state.offset + 10,
        products: [...state.products, ...products]);
  }
}

//todo: Clase que define el estado de los productos en el proveedor
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
  final List<Product> products;

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
  ProductsState copyWith({
    bool? isLastPage, // Permite cambiar si es la última página
    int? limit, // Permite cambiar el límite de productos
    int? offset, // Permite cambiar el desplazamiento
    bool? isLoading, // Permite cambiar el estado de carga
    List<Product>? products,
  }) => // Permite cambiar la lista de productos
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
