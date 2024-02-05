import 'package:dartz/dartz.dart';
import 'package:samplestore/core/errors/failure/failure.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList(String url);
}
