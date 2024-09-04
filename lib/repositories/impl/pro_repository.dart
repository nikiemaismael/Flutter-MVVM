import 'package:flutter/foundation.dart';
import 'package:mvvm/model/product.dart';
import 'package:mvvm/repositories/product_repository.dart';

class ProRepository implements IProductRepository {
  @override
  Future<void> addProduct(Product product) {
    if (kDebugMode) {
      print(
          "******************* Ceci est une nouvelle façon d'ajouter un produit: ${product.name}");
    }
    return Future.value(
      null,
    );
  }

  @override
  Future<List<Product>> getProducts() {
    print(
        "******************* Ceci est une nouvelle façon de recuperer les produits");
    return Future.value([]);
  }
}
