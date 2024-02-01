import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';
import 'package:samplestore/features/home/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ConstantColors.backgroundWhite,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ConstantColors.neutralLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 109,
            width: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(product.imageUrl),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.productName,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: ConstantColors.neutralDark),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "\$${product.discountPrice}",
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: ConstantColors.primaryColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "\$${product.exactPrice}",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: ConstantColors.neutralGrey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: ConstantColors.neutralGrey,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "${product.discountPercentage}% off",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: ConstantColors.primaryRed,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
