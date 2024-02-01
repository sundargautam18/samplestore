import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

Widget appCarousel(List<String> images) {
  return SizedBox(
    height: 250,
    child: CarouselSlider.builder(
        unlimitedMode: true,
        slideBuilder: (index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
        slideTransform: const CubeTransform(),
        slideIndicator: CircularSlideIndicator(
          currentIndicatorColor: HexColor(primaryColor),
          padding: const EdgeInsets.only(bottom: 32),
        ),
        itemCount: images.length),
  );
}
