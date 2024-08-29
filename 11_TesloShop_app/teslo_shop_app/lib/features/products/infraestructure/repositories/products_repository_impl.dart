import 'package:teslo_shop_app/features/products/domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<Producto> createUpdateProduct(Map<String, dynamic> productLike) {
    return datasource.createUpdateProduct(productLike);
  }

  @override
  Future<Producto> getProductsById(String id) {
    return datasource.getProductsById(id);
  }

  @override
  Future<List<Producto>> getProductsByPage({int limit = 10, int offset = 0}) {
    return datasource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Producto>> searchProducByTerm(String term) {
    return datasource.searchProducByTerm(term);
  }
}
