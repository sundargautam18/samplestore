import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

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
