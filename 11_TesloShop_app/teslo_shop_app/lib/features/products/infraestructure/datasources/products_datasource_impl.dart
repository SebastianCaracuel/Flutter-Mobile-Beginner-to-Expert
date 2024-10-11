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
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {'Authorization': 'Bearer $accessToken'},
        ));

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) async {
    try {
      final String? productId = productLike['id'];
      //Removemos el ID
      final String method = (productId == null) ? 'POST' : 'PATCH';
      productLike.remove('id');

      //
      final String url = (productId == null) ? '/post' : '/products/$productId';

      //Realizamos la peticion
      final response = await dio.request(
        url,
        data: productLike,
        options: Options(method: method),
      );

      //Llamamos al producto
      final product = ProductMapper.jsonToEntity(response.data);

      //Regresamos al nuevo producto
      return product;
    } catch (e) {
      throw Exception();
    }
  }

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

  @override
  Future<List<Product>> searchProducByTerm(String term) {
    // TODO: implement searchProducByTerm
    throw UnimplementedError();
  }
}
