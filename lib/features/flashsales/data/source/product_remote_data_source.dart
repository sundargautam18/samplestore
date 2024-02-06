import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:samplestore/core/dioclient/dio_client.dart';
import 'package:samplestore/core/errors/exceptions/exceptions.dart';
import 'package:samplestore/core/injection/injection_container.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProductList(String url);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio = locator.get<Dio>();

  @override
  Future<List<Product>> getProductList(String url) async {
    final response = await dio.get(url,options: dioOptions.copyWith(policy: CachePolicy.refresh).toOptions());

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      List<Product> productList =
          jsonList.map((json) => Product.fromJson(json)).toList();

      return productList;
    } else {
      throw ServerException("This is server exception");
    }
  }
}
