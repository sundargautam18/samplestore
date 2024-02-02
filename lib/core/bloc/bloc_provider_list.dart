import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/dioclient/dio_client.dart';
import 'package:samplestore/features/flashsales/data/cubit/product_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:samplestore/features/flashsales/data/repository/product_repository_impl.dart';
import 'package:samplestore/features/flashsales/data/source/product_remote_data_source.dart';

List<SingleChildWidget> get blocProviderList {
  InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();
  internetConnectionChecker.addresses = [
    AddressCheckOptions(hostname: 'google.com', port: 80)
  ];
  ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(dio: Client().init()),
      networkInfo: NetworkInfoImpl(internetConnectionChecker));
  return [
    BlocProvider(
      create: (context) => ProductCubit(productRepositoryImpl),
    ),
    //other bloc providers
  ];
}