import 'package:mvvm/model/product.dart';

import '../product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  List<Product> products = [];
  @override
  Future<void> addProduct(Product product) async {
    print(
        "******************* Ma methode interface d'ajout a été appeleée : ${product.name}");
    products.add(product);
  }

  /**
   * Retourne une liste de produit
   */
  @override
  Future<List<Product>> getProducts() async {
    // for (int i = 0; i < 5; i++) {
    //   products.add(
    //     Product(
    //         price: Random().nextInt(10000),
    //         name: "Produit $i",
    //         id: DateTime.now().toString(),
    //         description:
    //             'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
    //   );
    // }
    print('******************* la taille de la liste est :${products.length}');
    return products;
  }
}
