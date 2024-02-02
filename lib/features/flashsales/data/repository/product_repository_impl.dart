import 'package:dartz/dartz.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/constants/data/products.dart';
import 'package:samplestore/core/errors/exceptions/exceptions.dart';
import 'package:samplestore/core/errors/failure/failure.dart';
import 'package:samplestore/features/flashsales/business/repository/product_repository.dart';
import 'package:samplestore/features/flashsales/data/source/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getProductList(String url) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getProductList(url);

        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "This is server exceptoin"));
      }
    } else {
      return Left(ServerFailure(errorMessage: "No Internet"));
    }
  }
}
