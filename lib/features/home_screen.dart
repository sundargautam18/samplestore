import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/bottom_menu.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/features/landing/presentation/landing_screen.dart';
import 'package:samplestore/features/profile/presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: controller,
          children: const [LandingScreen(), ProfileScreen(), ProfileScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int currentIndex) {
          setState(() {
            index = currentIndex;
          });
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
