import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:samplestore/core/errors/failure/failure.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';
import 'package:samplestore/features/flashsales/business/repository/product_localrepository.dart';

class ProductLocalRepositoryImpl extends ProductLocalRepository {
  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    try {
      final products = await getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Error fetching products"));
    }
  }

  Future<void> storeProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>('products');

    await box.clear(); // Clear existing data
    for (var product in products) {
      await box.add(product);
    }
  }

// Retrieving products
  Future<List<Product>> getProducts() async {
    final box = await Hive.openBox<Product>('products');
    return box.values.toList().cast<Product>();
  }
}
