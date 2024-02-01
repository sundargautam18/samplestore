import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:samplestore/core/constants/colors.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentCarousel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CarouselSlider(
            items: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/images/recommendedImage.png"),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/images/carousel.png"),
                ),
              ),
            ],
            options: CarouselOptions(
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              pauseAutoPlayOnTouch: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) =>
                  setState(() => currentCarousel = index),
            ),
          ),
          _buildIndicator(
              imageUrls: ["a", "b"],
              currentCarousel: currentCarousel,
              indicatorColor: ConstantColors.primaryColor)
        ],
      ),
    );
  }
}

Row _buildIndicator({
  required List<String> imageUrls,
  required int currentCarousel,
  required Color indicatorColor,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: imageUrls.map(
      (url) {
        int index = imageUrls.indexOf(url);
        double size = currentCarousel == index ? 8 : 6;
        return Container(
          width: size,
          height: size,
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentCarousel == index
                ? ConstantColors.primaryColor
                : indicatorColor,
          ),
        );
      },
    ).toList(),
  );
}
