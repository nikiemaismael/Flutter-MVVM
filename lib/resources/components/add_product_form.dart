import 'package:flutter/material.dart';
import 'package:mvvm/viewModel/product_view_model.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(builder: (context, value, child) {
      return Form(
        key: value.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text('Ajouter un produit'),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nom du produit'),
                controller: value.nameController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Prix du produit'),
                controller: value.priceController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: 'Description du produit'),
                controller: value.descriptionController,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    value.addProduct();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ajouter'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
