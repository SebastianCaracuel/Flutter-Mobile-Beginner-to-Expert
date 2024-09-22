//? Este es un archivo del formulario del producto con provider

//Importaciones flutter
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/features/shared/shared.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';

//todo:Notifier
class ProductFormNotifier extends StateNotifier<ProductFormState> {
  //
  final void Function(Map<String, dynamic> productLike)? onSubmitCallback;

  ProductFormNotifier({this.onSubmitCallback, required Producto product})
      : super(ProductFormState(
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

  //Método para para cambiar el titulo del producto, y la validación de los formularios.
  void onTitleChanged(String value) {
    state = state.copyWith(
        title: Title.dirty(value),
        isFormValid: Formz.validate(
          [
            Title.dirty(value),
            Slug.dirty(state.slug.value),
            Price.dirty(state.price.value),
            Stock.dirty(state.inStock.value),
          ],
        ));
  }

  //Método para para cambiar el Slug  del producto, y la validación de los formularios.
  void onSlugChanged(String value) {
    state = state.copyWith(
        slug: Slug.dirty(value),
        isFormValid: Formz.validate(
          [
            Title.dirty(state.title.value),
            Slug.dirty(value),
            Price.dirty(state.price.value),
            Stock.dirty(state.inStock.value),
          ],
        ));
  }

  //Método para para cambiar el Precio  del producto, y la validación de los formularios.
  void onPricehanged(double value) {
    state = state.copyWith(
        price: Price.dirty(value),
        isFormValid: Formz.validate(
          [
            Title.dirty(state.title.value),
            Slug.dirty(state.slug.value),
            Price.dirty(value),
            Stock.dirty(state.inStock.value),
          ],
        ));
  }

  //Método para para cambiar el Stock  del producto, y la validación de los formularios.
  void onStockehanged(int value) {
    state = state.copyWith(
        inStock: Stock.dirty(value),
        isFormValid: Formz.validate(
          [
            Title.dirty(state.title.value),
            Slug.dirty(state.slug.value),
            Price.dirty(state.price.value),
            Stock.dirty(value),
          ],
        ));
  }

  //Método para cambiar el Size o el tamaño de los productos
  void onSizeChanged(List<String> sizes) {
    state = state.copyWith(sizes: sizes);
  }

  //Método para cambiar el Gender o el genero de los productos
  void onGenderChanged(String gender) {
    state = state.copyWith(gender: gender);
  }

  //Método para cambiar la descripción del producto
  void onDescriptionChanged(String description) {
    state = state.copyWith(description: description);
  }
}

//todo: Creamos la clase de nuestor ProductForm STATE
class ProductFormState {
  //Parametros
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

  //COnstructor con parametros
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

  //?CopyWith
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
