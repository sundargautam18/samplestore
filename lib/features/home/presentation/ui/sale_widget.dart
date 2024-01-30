import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';

class SaleWidget extends StatelessWidget {
  final String saleName;
  const SaleWidget({super.key, required this.saleName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  saleName,
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
            )
          ],
        ),
      ),
    );
  }
}
