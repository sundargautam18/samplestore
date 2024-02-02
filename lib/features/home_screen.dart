import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/bottom_menu.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

import 'package:samplestore/features/landing/presentation/landing_screen.dart';
import 'package:samplestore/features/profile/presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final int currentIndex;
  const HomeScreen({super.key, required this.currentIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  final box = GetStorage();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    index = widget.currentIndex;
    controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [LandingScreen(), ProfileScreen(), ProfileScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int currentIndex) {
          setState(() {
            index = currentIndex;
          });
          box.write("index", index);
          controller.animateTo(index);
        },
        items: <BottomNavigationBarItem>[
          ...bottomMenus.map((e) => BottomNavigationBarItem(
                icon: e.icon,
                label: e.name,
              ))
        ],
        selectedItemColor: HexColor(primaryColor),
        // Theme for colors
        unselectedItemColor: HexColor(appGrey),
        selectedIconTheme: IconThemeData(color: HexColor(primaryColor)),
        unselectedIconTheme: IconThemeData(color: HexColor(appGrey)),
      ),
    );
  }
}
