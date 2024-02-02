import 'package:dartz/dartz.dart';
import 'package:samplestore/core/constants/data/products.dart';
import 'package:samplestore/core/errors/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList(String url);
}
