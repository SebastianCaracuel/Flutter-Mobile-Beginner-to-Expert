//? Este es un archivo de implementación del datasource

//Importaciones Flutter
import 'package:dio/dio.dart';

//Importaciones nuestras
import '../mappers/products_mapper.dart';
import 'package:teslo_shop_app/config/config.dart';
import 'package:teslo_shop_app/features/products/domain/domain.dart';
import '../errors/product_errors.dart';

class ProductsDatasourceImpl extends ProductsDatasource {
  //Utilizamos DIO
  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({required this.accessToken})
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        );

//Método para cargar el archivo
  Future<String> _uploadFile(String path) async {
    try {
      final fileName = path.split('/').last;
      final FormData data = FormData.fromMap(
          {'file': MultipartFile.fromFileSync(path, filename: fileName)});

      final respose = await dio.post('/files/product', data: data);

      return respose.data['image'];
    } catch (e) {
      throw Exception();
    }
  }

  //Método para subir las imagenes
  Future<List<String>> _uploadPhotos(List<String> photos) async {
    final photosToUpload =
        photos.where((element) => element.contains('/')).toList();
    final photosToIgnore =
        photos.where((element) => !element.contains('/')).toList();

    //todo: crear una serie de Futures de carga de imágenes
    final List<Future<String>> uploadJob =
        photosToUpload.map(_uploadFile).toList();

    final newImages = await Future.wait(uploadJob);

    return [...photosToIgnore, ...newImages];
  }

  //Método para crear o actualizar un producto
  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) async {
    try {
      final String? productId = productLike['id'];
      final String method = (productId == null) ? 'POST' : 'PATCH';
      final String url =
          (productId == null) ? '/products' : '/products/$productId';

      //Removemos el ID
      productLike.remove('id');
      productLike['images'] = await _uploadPhotos(productLike['images']);

      final response = await dio.request(
        url,
        data: productLike,
        options: Options(method: method),
      );

      final product = ProductMapper.jsonToEntity(response.data);

      //Regresamos el nuevo producto actualizado
      return product;

      //Si falla
    } catch (e) {
      throw Exception();
    }
  }

//Método para obtener un producto en base a su ID
  @override
  Future<Product> getProductsById(String id) async {
    try {
      //? si todo sale bine
      final response = await dio.get('/products/$id');
      final product = ProductMapper.jsonToEntity(response.data);

      //retornamos el producto si todo sale bien
      return product;

      //!Si no recibimos un producto de esos
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw ProductNotFound();
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

//Método para obtener un producto
  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response =
        await dio.get<List>('/products?limit=$limit&offset=$offset');

    //Producto
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }
    return products;
  }

//Método para buscar un producto
  @override
  Future<List<Product>> searchProducByTerm(String term) {
    // TODO: implement searchProducByTerm
    throw UnimplementedError();
  }
}
