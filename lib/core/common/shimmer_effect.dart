import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer generateShimmer(double? height, double? width) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: const Color.fromARGB(255, 254, 254, 254),
    child: Container(
      height: height,
      width: width,
      color: Colors.white,
    ),
  );
}
