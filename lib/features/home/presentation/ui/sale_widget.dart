import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';
import 'package:samplestore/features/home/data/models/product_model.dart';
import 'package:samplestore/features/home/presentation/ui/product_card.dart';

class SaleWidget extends StatelessWidget {
  final SaleModel products;
  const SaleWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  products.saleName,
                  style: const TextStyle(
                      color: ConstantColors.neutralDark,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  "See More",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: ConstantColors.primaryColor,
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 238,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.productData.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products.productData[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
