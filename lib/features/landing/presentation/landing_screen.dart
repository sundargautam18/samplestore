import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/common/counter.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/features/landing/presentation/component/product_card.dart';
import 'package:timer_count_down/timer_count_down.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onTap: () => context.go("/search"),
            decoration: InputDecoration(
                hintText: "Search products",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: HexColor(primaryColor)),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: HexColor(primaryColor),
                ),
                hintStyle: TextStyle(color: HexColor(appGrey)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                  color: HexColor(primaryColor),
                ))),
          ),
          actions: [
            const Icon(Icons.notifications),
            16.horizontalSpace,
            const Icon(Icons.heart_broken_rounded),
            16.horizontalSpace,
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
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
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Category",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "More category",
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
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                        generateCard(),
                        16.horizontalSpace,
                      ],
                    ),
                  )
                ],
              ),
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
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                      ],
                    ),
                  )
                ],
              ),
              16.verticalSpace,
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mega sale",
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
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                      ],
                    ),
                  )
                ],
              ),
              16.verticalSpace,
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
                            "Recomended Product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white),
                          ),
                          28.verticalSpace,
                          const Text(
                            "We recommended for you",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        )));
  }

  static Widget  generateCard() {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: HexColor(primaryColor))),
          child: Center(
            child: Icon(EvaIcons.flag, color: HexColor(primaryColor)),
          ),
        ),
        8.verticalSpace,
        Text(
          "Man shirt",
          style: TextStyle(color: HexColor(appGrey)),
        )
      ],
    );
  }
}
