import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/common/counter.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
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
              )
            ]),
          ),
        )));
  }
}
