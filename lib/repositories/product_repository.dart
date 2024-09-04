import '../model/product.dart';

abstract class IProductRepository {
  Future<void> addProduct(Product product);
  Future<List<Product>> getProducts();
}
