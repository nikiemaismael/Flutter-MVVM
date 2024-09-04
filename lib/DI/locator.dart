import 'package:get_it/get_it.dart';
import 'package:mvvm/repositories/impl/product_repository_impl.dart';
import 'package:mvvm/repositories/product_repository.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  print("Setting up locator...");
  // locator.registerFactory<IProductRepository>(
  //   () => ProductRepositoryImpl(),

  locator.registerFactory<IProductRepository>(
    () => ProductRepositoryImpl(),
  );
}
