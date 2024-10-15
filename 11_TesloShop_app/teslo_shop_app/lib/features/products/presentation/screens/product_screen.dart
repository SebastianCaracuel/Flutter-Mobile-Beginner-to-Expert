//? Crear, o actualizar los productos

//Importación flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importación Nuestras
import 'package:teslo_shop_app/features/shared/shared.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';
import 'package:teslo_shop_app/features/products/presentation/providers/providers.dart';

//todo: ProductScreen
class ProductScreen extends ConsumerWidget {
  //parametro
  final String productId;

  //Constructor
  const ProductScreen({
    super.key,
    required this.productId,
  });

  //todo:creamos un nuevo método
  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Producto Actualizado')));
  }

  @override
  Widget build(BuildContext context, ref) {
    //parametros del objeto
    final productState = ref.watch(productProvider(productId));

    //!Widget padre
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Producto'),
          actions: [
            //? Botón para escoger una foto de la galeria
            IconButton(
                onPressed: () async {
                  //Ocultamos el teclado al darle al botón guardar.
                  FocusScope.of(context).unfocus();
                  final photoPath =
                      await CameraGalleryServiceImpl().selectPhoto();
                  //Preguntamos
                  if (photoPath == null) return;
                  photoPath;
                },
                icon: const Icon(Icons.photo_library_rounded)),

            //? Botón para sacar una fotografía.
            IconButton(
                onPressed: () async {
                  //Ocultamos el teclado al darle al botón guardar.
                  FocusScope.of(context).unfocus();
                  final photoPath =
                      await CameraGalleryServiceImpl().takePhoto();
                  //Preguntamos
                  if (photoPath == null) return;
                  photoPath;
                },
                icon: const Icon(Icons.camera_alt_outlined))
          ],
        ),
        body: productState.isLoading
            ? const FullScreenLoader()
            : _ProductView(product: productState.product!),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Ocultamos el teclado al darle al botón guardar.
              FocusScope.of(context).unfocus();
              //Condición, si no encuentra el producto, entonces no hace nada
              if (productState.product == null) return;
              //
              ref
                  .read(productFormProvider(productState.product!).notifier)
                  .onFormSubmit()
                  .then((value) {
                if (!value) return;
                showSnackbar(context);
              });
            },
            child: const Icon(Icons.save_as_outlined)),
      ),
    );
  }
}

//todo: Vista del Producto. Este es el Codigo de Fernando Herrera del curso - Sección 29
class _ProductView extends ConsumerWidget {
  final Product product;

  const _ProductView({required this.product});

  @override
  Widget build(BuildContext context, ref) {
    //Llamamos a nuestro provider del formulario del producto
    final productForm = ref.watch(productFormProvider(product));

    final textStyles = Theme.of(context).textTheme;

    return ListView(
      children: [
        SizedBox(
          height: 250,
          width: 600,
          child: _ImageGallery(images: productForm.images),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            productForm.title.value,
            style: textStyles.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        _ProductInformation(product: product),
      ],
    );
  }
}

//todo: Información del producto
class _ProductInformation extends ConsumerWidget {
  final Product product;
  const _ProductInformation({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Llamamos al provider del formulario del producto
    final productForm = ref.watch(productFormProvider(product));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Generales'),
          const SizedBox(height: 15),
          CustomProductField(
            isTopField: true,
            label: 'Nombre',
            initialValue: productForm.title.value,
            onChanged:
                ref.read(productFormProvider(product).notifier).onTitleChanged,
            errorMessage: productForm.title.errorMessage,
          ),
          CustomProductField(
            label: 'Slug',
            initialValue: productForm.slug.value,
            onChanged:
                ref.read(productFormProvider(product).notifier).onSlugChanged,
            errorMessage: productForm.slug.errorMessage,
          ),
          CustomProductField(
            isBottomField: true,
            label: 'Precio',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: productForm.price.value.toString(),
            onChanged: (value) => ref
                .read(productFormProvider(product).notifier)
                .onPriceChanged(double.tryParse(value) ?? -1),
            errorMessage: productForm.price.errorMessage,
          ),
          const SizedBox(height: 15),
          const Text('Extras'),

          //todo: tallas
          _SizeSelector(
            selectedSizes: productForm.sizes,
            onSizesChanged:
                ref.read(productFormProvider(product).notifier).onSizeChanged,
          ),
          const SizedBox(height: 5),

          //todo: genero
          _GenderSelector(
            selectedGender: productForm.gender,
            onGenderChanged:
                ref.read(productFormProvider(product).notifier).onGenderChanged,
          ),
          const SizedBox(height: 15),
          //todo: stock
          CustomProductField(
            isTopField: true,
            label: 'Existencias',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: productForm.inStock.value.toString(),
            onChanged: (value) => ref
                .read(productFormProvider(product).notifier)
                .onStockChanged(int.tryParse(value) ?? -1),
            errorMessage: productForm.inStock.errorMessage,
          ),
          //todo:descripción
          CustomProductField(
            maxLines: 6,
            label: 'Descripción',
            keyboardType: TextInputType.multiline,
            initialValue: productForm.description,
            onChanged: ref
                .read(productFormProvider(product).notifier)
                .onDescriptionChanged,
          ),
          //todo: tags
          CustomProductField(
            isBottomField: true,
            maxLines: 2,
            label: 'Tags (Separados por coma)',
            keyboardType: TextInputType.multiline,
            initialValue: product.tags.join(', '),
            onChanged:
                ref.read(productFormProvider(product).notifier).onTagasChanged,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

//todo: Seleccion de tallas
class _SizeSelector extends StatelessWidget {
  final List<String> selectedSizes;
  final List<String> sizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  //Para poder cambiar el listado
  final void Function(List<String> selectedSizes) onSizesChanged;

  const _SizeSelector({
    required this.selectedSizes,
    required this.onSizesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: sizes.map((size) {
        return ButtonSegment(
            value: size,
            label: Text(size, style: const TextStyle(fontSize: 10)));
      }).toList(),
      selected: Set.from(selectedSizes),
      onSelectionChanged: (newSelection) {
        //Ocultamos el teclado al darle al botón guardar.
        FocusScope.of(context).unfocus();
        onSizesChanged(List.from(newSelection));
      },
      multiSelectionEnabled: true,
    );
  }
}

//todo: Selecionamos el genero
class _GenderSelector extends StatelessWidget {
  final String selectedGender;
  final void Function(String selectedGender) onGenderChanged;
  final List<String> genders = const ['men', 'women', 'kid'];
  final List<IconData> genderIcons = const [
    Icons.man,
    Icons.woman,
    Icons.boy,
  ];

  const _GenderSelector(
      {required this.selectedGender, required this.onGenderChanged});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton(
        multiSelectionEnabled: false,
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        segments: genders.map((size) {
          return ButtonSegment(
              icon: Icon(genderIcons[genders.indexOf(size)]),
              value: size,
              label: Text(size, style: const TextStyle(fontSize: 12)));
        }).toList(),
        selected: {selectedGender},
        onSelectionChanged: (newSelection) {
          //Ocultamos el teclado al darle al botón guardar.
          FocusScope.of(context).unfocus();
          onGenderChanged(newSelection.first);
        },
      ),
    );
  }
}

//todo:
class _ImageGallery extends StatelessWidget {
  final List<String> images;
  const _ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.7),
      children: images.isEmpty
          ? [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset('assets/images/no-image.jpg',
                      fit: BoxFit.cover))
            ]
          : images.map((e) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  e,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
    );
  }
}
