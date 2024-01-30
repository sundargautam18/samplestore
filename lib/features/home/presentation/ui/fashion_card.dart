import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samplestore/features/home/data/models/men_faishon_model.dart';

class FashionCard extends StatelessWidget {
  final FashionData item;
  const FashionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Key(item.id),
      width: 70,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(23),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ConstantColors.neutralLight, width: 1),
              color: ConstantColors.backgroundWhite,
            ),
            child: SvgPicture.asset(
              item.svgPath,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ConstantColors.neutralGrey,
                fontFamily: "Poppins",
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
