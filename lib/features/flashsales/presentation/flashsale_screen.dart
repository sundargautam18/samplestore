import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:samplestore/core/common/counter.dart';
import 'package:samplestore/core/common/shimmer_effect.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/core/dioclient/dio_client.dart';
import 'package:samplestore/features/flashsales/data/cubit/product_cubit.dart';
import 'package:samplestore/features/flashsales/data/repository/product_repository_impl.dart';
import 'package:samplestore/features/flashsales/data/source/product_remote_data_source.dart';
import 'package:samplestore/features/landing/presentation/component/product_card.dart';
import 'package:shimmer/shimmer.dart';

class FlashSales extends StatefulWidget {
  const FlashSales({super.key});

  @override
  State<FlashSales> createState() => _FlashSalesState();
}

class _FlashSalesState extends State<FlashSales> {
  get product => null;

  @override
  void initState() {
    super.initState();
    _getArticle();
  }

  _getArticle() {
    BlocProvider.of<ProductCubit>(context).getProductList("products/1");
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);

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
      body: BlocConsumer<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Column(
              children: [
                generateShimmer(206.h, MediaQuery.of(context).size.width),
                16.verticalSpace,
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Flash sale",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor(primaryColor)),
                        )
                      ],
                    ),
                    12.verticalSpace,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              500,
                              (index) => Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: generateShimmer(150, 150)))
                        ],
                      ),
                    )
                  ],
                )
              ],
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

                // SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(children: [
                //       ...state.productList
                //           .map((product) => ProductCardMod(product: product))
                //     ])),

                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Flash sale",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor(primaryColor)),
                        )
                      ],
                    ),
                    12.verticalSpace,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...state.productList.map(
                              (product) => ProductCardMod(product: product))
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    TextButton(
                        onPressed: () {
                          productCubit.deleteProduct();
                        },
                        child: Text("Delete"))
                  ],
                )
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
        },
        listener: (context, state) {
          if (state is ProductDeleteSucess) {
            Alert(context: context, title: "Deleted Successfully", buttons: [])
                .show();
            productCubit.getProductList("products");
          }
        },
      ),
    );
  }
}
