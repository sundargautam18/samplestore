import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:samplestore/core/common/counter.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/dioclient/dio_client.dart';
import 'package:samplestore/features/flashsales/data/cubit/product_cubit.dart';
import 'package:samplestore/features/flashsales/data/repository/product_repository_impl.dart';
import 'package:samplestore/features/flashsales/data/source/product_remote_data_source.dart';

class FlashSales extends StatefulWidget {
  const FlashSales({super.key});

  @override
  State<FlashSales> createState() => _FlashSalesState();
}

class _FlashSalesState extends State<FlashSales> {
  @override
  void initState() {
    super.initState();
    _getArticle();
  }

  _getArticle() {
    BlocProvider.of<ProductCubit>(context).getProductList("products");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Super flash sales",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => context.go("/search"),
              icon: const Icon(Icons.search)),
          16.horizontalSpace
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSucess) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 206.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/banner/banner.png",
                            ))),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Super Flash Sale 50% Off",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white),
                          ),
                          28.verticalSpace,
                          SalesCounter(seconds: 3500400, onFinished: () => {})
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
            ],
          );
        } else if (state is ProductError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      }),
    );
  }
}
