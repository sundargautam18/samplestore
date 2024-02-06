import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:samplestore/core/app_pathprovider.dart';


class Client {
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(DioCacheInterceptor(
      options: CacheOptions(
        store: HiveCacheStore(AppPathProvider.path),
        policy: CachePolicy.refreshForceCache,
        hitCacheOnErrorExcept: [],
        maxStale: const Duration(
          days: 2,
        ), //increase number of days for loger cache
        priority: CachePriority.high,
      ),
    ));
    //dio.interceptors.add(ApiInterceptors(token));
    dio.options.baseUrl = "https://api.escuelajs.co/api/v1/";

    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  final String token;

  ApiInterceptors(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add Bearer token to the headers
    options.headers["Authorization"] = "Bearer sample";

    // You can also print the data for debugging purposes
    print(options.data);

    super.onRequest(options, handler);
  }
}
