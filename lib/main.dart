import 'package:flutter/material.dart';
import 'package:mvvm/DI/locator.dart';
import 'package:mvvm/repositories/product_repository.dart';
import 'package:mvvm/view/product_view.dart';
import 'package:mvvm/viewModel/product_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  // configuration pour l'injection de dependance
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(
              productRepository: locator<IProductRepository>()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductView(),
      ),
    );
  }
}
