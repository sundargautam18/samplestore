import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/dioclient/dio_client.dart';
import 'package:samplestore/core/storage/secure_storage.dart';

GetIt locator = GetIt.instance;

void setup() {
  InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();
  internetConnectionChecker.addresses = [
    AddressCheckOptions(hostname: 'google.com', port: 80)
  ];
  locator.registerSingleton<SecureStorage>(SecureStorage());
  locator.registerSingleton<Dio>(Client().init());
  locator.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(internetConnectionChecker));
}
