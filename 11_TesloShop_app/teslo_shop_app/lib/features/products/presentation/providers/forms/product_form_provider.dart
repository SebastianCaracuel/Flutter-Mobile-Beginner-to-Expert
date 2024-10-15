//Importaciones Flutter
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/config/config.dart';
import 'package:teslo_shop_app/features/shared/shared.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';
import 'package:teslo_shop_app/features/products/presentation/providers/providers.dart';

//todo: STATE PROVIDER
class ProductFormState {
  //atributos
  final bool isFormValid;
  final String? id;
  final Title title;
  final Slug slug;
  final Price price;
  final List<String> sizes;
  final String gender;
  final Stock inStock;
  final String description;
  final String tags;
  final List<String> images;

  //Constructor
  ProductFormState({
    this.isFormValid = false,
    this.id,
    this.title = const Title.dirty(''),
    this.slug = const Slug.dirty(''),
    this.price = const Price.dirty(0),
    this.sizes = const [],
    this.gender = 'men',
    this.inStock = const Stock.dirty(0),
    this.description = '',
    this.tags = '',
    this.images = const [],
  });

  //? Creamos el CopyWith
  ProductFormState copyWith({
    bool? isFormValid,
    String? id,
    Title? title,
    Slug? slug,
    Price? price,
    List<String>? sizes,
    String? gender,
    Stock? inStock,
    String? description,
    String? tags,
    List<String>? images,
  }) =>
      ProductFormState(
        isFormValid: isFormValid ?? this.isFormValid,
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        price: price ?? this.price,
        sizes: sizes ?? this.sizes,
        gender: gender ?? this.gender,
        inStock: inStock ?? this.inStock,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        images: images ?? this.images,
      );
}

//todo: NOTIFIER
class ProductFormNotifier extends StateNotifier<ProductFormState> {
  //con este onSubmitcallback vamos intentar mandar la información
  final Future<bool> Function(Map<String, dynamic> productLike)?
      onSubmitCallback;

  //Constructor
  ProductFormNotifier({
    this.onSubmitCallback,
    required Product product,
  }) : super(ProductFormState(
          id: product.id,
          title: Title.dirty(product.title),
          slug: Slug.dirty(product.slug),
          price: Price.dirty(product.price),
          inStock: Stock.dirty(product.stock),
          sizes: product.sizes,
          gender: product.gender,
          description: product.description,
          tags: product.tags.join(', '),
          images: product.images,
        ));

  Future<bool> onFormSubmit() async {
    _touchedEverything();

    //Si el formulario no es valido, no voy a mandar nada
    if (!state.isFormValid) return false;

    //tenemos la función?
    if (onSubmitCallback == null) return false;

    //Sí tenemos la función de onSubmitCallback
    final productLike = {
      'id': (state.id == 'new') ? null : state.id,
      'title': state.title.value,
      'price': state.price.value,
      'description': state.description,
      'slug': state.slug.value,
      'stock': state.inStock.value,
      'sizes': state.sizes,
      'gender': state.gender,
      'tags': state.tags.split(','),
      'images': state.images
          .map((image) =>
              image.replaceAll('${Environment.apiUrl}/files/product/', ''))
          .toList()
    };

    //TODO:ACA ESTABAS TRABAJADNO SEBASTIAN
    try {
      //Si todo sale bien

      return await onSubmitCallback!(productLike);

      //SI falla
    } catch (e) {
      return false;
    }
  }

  //?Creamos un método privado para tocar cada uno de los campos
  void _touchedEverything() {
    state = state.copyWith(
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(state.slug.value),
        Price.dirty(state.price.value),
        Stock.dirty(state.inStock.value),
      ]),
    );
  }

  //Método para cambiar el titulo
  void onTitleChanged(String value) {
    state = state.copyWith(
      title: Title.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(value),
        Slug.dirty(state.slug.value),
        Price.dirty(state.price.value),
        Stock.dirty(state.inStock.value),
      ]),
    );
  }

  //Método para cambiar el Slug
  void onSlugChanged(String value) {
    state = state.copyWith(
      slug: Slug.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(value),
        Price.dirty(state.price.value),
        Stock.dirty(state.inStock.value),
      ]),
    );
  }

  //Método para cambiar el Precio
  void onPriceChanged(double value) {
    state = state.copyWith(
      price: Price.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(state.slug.value),
        Price.dirty(value),
        Stock.dirty(state.inStock.value),
      ]),
    );
  }

  //Método para cambiar el Stock
  void onStockChanged(int value) {
    state = state.copyWith(
      inStock: Stock.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(state.slug.value),
        Price.dirty(state.price.value),
        Stock.dirty(value),
      ]),
    );
  }

  //Método para cambiar el Size
  void onSizeChanged(List<String> sizes) {
    state = state.copyWith(sizes: sizes);
  }

  //Método para cambiar el genero
  void onGenderChanged(String gender) {
    state = state.copyWith(gender: gender);
  }

  //Método para cambiar la description
  void onDescriptionChanged(String description) {
    state = state.copyWith(description: description);
  }

  //Método para cambiar los Tags
  void onTagasChanged(String tags) {
    state = state.copyWith(tags: tags);
  }
}

//todo: PROVIDER
final productFormProvider = StateNotifierProvider.autoDispose
    .family<ProductFormNotifier, ProductFormState, Product>((ref, product) {
  //final createUpdateCallback = ref.watch(productsRepositoryProvider).createUpdateProduct;

  final createUpdateCallback =
      ref.watch(productsProvider.notifier).createOrUpdateProduct;

  //constructor
  return ProductFormNotifier(
    product: product,
    onSubmitCallback: createUpdateCallback,
  );
});
