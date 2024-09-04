import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/add_product_form.dart';
import 'package:mvvm/resources/components/botton_sheet.dart';
import 'package:mvvm/viewModel/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductViewModel>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Mes produits'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text('Liste des produits'),
            Consumer<ProductViewModel>(
              builder: (context, value, child) {
                return value.products.isEmpty
                    ? const Column(
                        children: [
                          Center(
                            child: Text('Aucun produit disponible'),
                          ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: value.products.length,
                            itemBuilder: (context, index) {
                              final product = value.products[index];
                              return ListTile(
                                onTap: () {},
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      index.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                title: Text(product.name),
                                subtitle: Expanded(
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    product.description.toString(),
                                  ),
                                ),
                                trailing: Text(
                                  '${product.price}FCFA',
                                ),
                              );
                            }),
                      );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            showResponsiveBottomSheet(context, const AddProductForm());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
