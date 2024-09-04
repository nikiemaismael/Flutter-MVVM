import 'package:flutter/material.dart';
import 'package:mvvm/repositories/product_repository.dart';

import '../model/product.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel({required this.productRepository});
  late IProductRepository productRepository;
  late List<Product> products = [];

  // Controlle du formulaire d'ajout de product
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> getProducts() async {
    products = (await productRepository.getProducts()).cast<Product>();
    print('******************* la taille de la liste est :${products.length}');
    notifyListeners();
  }

  Future<void> addProduct() async {
    if (formKey.currentState!.validate()) {
      Product product = Product(
        name: nameController.text,
        price: int.parse(priceController.text),
        description: descriptionController.text,
        id: '${DateTime.now()}',
      );
      print(
          "******************* Ma methode d'jout a été appellée : ${product.name}");
      await productRepository.addProduct(product);
      nameController.clear();
      priceController.clear();
      descriptionController.clear();
      getProducts();
      notifyListeners();
    }
    notifyListeners();
  }
}
