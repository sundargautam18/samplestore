import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/bottom_menu.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

class AppLayout extends StatefulWidget {
  final Widget body;
  final String title;
  const AppLayout({super.key, required this.body, required this.title});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back))),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });

          context.go(bottomMenus[value].route);
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
