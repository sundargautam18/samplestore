import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplestore/features/animation/cart_cubit.dart';
import 'package:samplestore/features/animation/counter_cubit.dart';

import 'package:samplestore/features/flashsales/data/cubit/product_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:samplestore/features/flashsales/data/repository/product_repository_impl.dart';
import 'package:samplestore/features/flashsales/data/source/product_remote_data_source.dart';

List<SingleChildWidget> get blocProviderList {
  ProductRepositoryImpl productRepositoryImpl =
      ProductRepositoryImpl(remoteDataSource: ProductRemoteDataSourceImpl());
  return [
    BlocProvider(
      create: (context) => ProductCubit(productRepositoryImpl),
    ),
    BlocProvider(
      create: (context) => CounterCubit(),
    ),
    BlocProvider(
      create: (context) => CartCubit(),
    ),
    //other bloc providers
  ];
}
