import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/common/shimmer_effect.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';
import 'package:strings/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go("/product/$name"),
      child: Container(
        width: 150,
        decoration: BoxDecoration(border: Border.all(color: HexColor(appGrey))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn.britannica.com/04/123704-050-023DC490/Pair-leather-shoes.jpg",
                height: 100,
                width: 100,
              ),
              const Text("FS - Nike Air Max 270 React..."),
              Text(
                "Rs.599.99",
                style: TextStyle(
                  color: HexColor(primaryColor),
                ),
              ),
              Text(
                "Rs.499.99 24% off",
                style: TextStyle(
                  fontSize: 12,
                  color: HexColor(appGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardMod extends StatelessWidget {
  final Product product;
  const ProductCardMod({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Container(
          width: 150,
          decoration:
              BoxDecoration(border: Border.all(color: HexColor(appGrey))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: product.images![0].toString(),
                  placeholder: (BuildContext context, String url) =>
                      generateShimmer(100, MediaQuery.of(context).size.width),
                  errorWidget: (BuildContext context, String url,
                          dynamic error) =>
                      generateShimmer(100, MediaQuery.of(context).size.width),
                ),
                8.verticalSpace,
                Text(Strings.join([
                  Strings.left(product.title, 12),
                  Strings.length(product.title) > 12 ? "..." : ""
                ])),
                Text(
                  Strings.join(["Rs.", product.price.toString()]),
                  style: TextStyle(
                    color: HexColor(primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
