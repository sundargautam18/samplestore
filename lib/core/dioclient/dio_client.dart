import 'package:dio/dio.dart';

class Client {
  Dio init() {
    Dio dio = Dio();
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
