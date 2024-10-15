// Este archivo define un proveedor y un Notifier para ver o editar un producto en particular

// Importamos las utilidades necesarias de Flutter Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importamos nuestro proveedor de repositorio de productos
import './products_repository_provider.dart';
// Importamos nuestras entidades del dominio, que probablemente incluyen 'Producto'
import 'package:teslo_shop_app/features/products/domain/domain.dart';

// todo: Creamos un StateNotifierProvider utilizando el modificador 'autoDispose' y 'family'
// autoDispose: permite liberar los recursos cuando el proveedor ya no se necesita
// family: permite pasar parámetros (en este caso 'productId') al proveedor
final productProvider = StateNotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>((ref, productId) {
  // Obtenemos el repositorio de productos usando 'productsRepositoryProvider'
  final productsRepository = ref.watch(productsRepositoryProvider);

  // Retornamos una instancia de 'ProductNotifier' pasando el repositorio y el 'productId'
  return ProductNotifier(
    productsRepository: productsRepository,
    productId: productId,
  );
});

//todo: NOTIFIER
class ProductNotifier extends StateNotifier<ProductState> {
  // Dependencia del repositorio de productos
  final ProductsRepository productsRepository;

  // Constructor de 'ProductNotifier'
  // Recibe el repositorio de productos y el 'productId' para inicializar el estado
  ProductNotifier({
    required this.productsRepository,
    required String productId,
  }) : super(ProductState(id: productId)) {
    loadProduct();
  }

  //? Creamos un producto en blanco o vacio
  Product newEmptyProduct() {
    return Product(
      id: 'new',
      title: 'Nuevo titulo',
      price: 0,
      description: 'Añade una descripción',
      slug: '',
      stock: 0,
      sizes: [],
      gender: 'men',
      tags: [],
      images: [],
    );
  }

  // Método que permitirá cargar el producto desde el repositorio
  Future<void> loadProduct() async {
    try {
      //Si el state id es nuevo
      if (state.id == 'new') {
        //Le mandamos el nuevo producto vacio
        state = state.copywith(
          isLoading: false,
          product: newEmptyProduct(),
        );
        return;
      }
      //Llamamos al producto mediante el repository
      final product = await productsRepository.getProductsById(state.id);

      //SI tenemos un producto y todo sale bien
      state = state.copywith(
        isLoading: false,
        product: product,
      );

      //Puede ser que el producto exista o no exista
    } catch (e) {
      //? SI el producto no existe entonces ERROR '404' product not found

      //Si sale algo mal

      print(e);
    }
  }
}

// todo: STATE
class ProductState {
  // Propiedades del estado de un producto
  final String id; // Identificador del producto
  final Product?
      product; // El producto en sí, puede ser nulo si no ha sido cargado
  final bool isLoading; // Indica si se está cargando el producto
  final bool isSaving; // Indica si se está guardando el producto

  // Constructor que inicializa las propiedades del estado
  // Por defecto, el producto está en modo 'isLoading' al crearse el estado
  ProductState(
      {required this.id,
      this.product,
      this.isLoading = true, // Por defecto, se considera que está cargando
      this.isSaving = false}); // Por defecto, no está guardando cambios

  // Método 'copywith' que permite crear una copia del estado actual
  // Permite cambiar algunas propiedades sin modificar el estado original
  ProductState copywith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) =>
      // Retorna una nueva instancia de 'ProductState' con las propiedades modificadas
      ProductState(
        id: id ?? this.id,
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );
}
