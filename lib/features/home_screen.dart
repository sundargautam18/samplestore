import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/bottom_menu.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/core/messaging_service.dart';

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
  final box = GetStorage();
  final messagingService = MessagingService();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    messagingService.init();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// check if overlay permission is granted
          final bool status = await FlutterOverlayWindow.isPermissionGranted();

          /// Open overLay content
          ///
          /// - Optional arguments:
          /// `height` the overlay height and default is [overlaySizeFill]
          /// `width` the overlay width and default is [overlaySizeFill]
          /// `OverlayAlignment` the alignment postion on screen and default is [OverlayAlignment.center]
          /// `OverlayFlag` the overlay flag and default is [OverlayFlag.defaultFlag]
          /// `overlayTitle` the notification message and default is "overlay activated"
          /// `overlayContent` the notification message
          /// `enableDrag` to enable/disable dragging the overlay over the screen and default is "false"
          /// `positionGravity` the overlay postion after drag and default is [PositionGravity.none]
          await FlutterOverlayWindow.showOverlay();

          /// Update the overlay size in the screen
          await FlutterOverlayWindow.resizeOverlay(80, 120);
        },
        child: Icon(Icons.draw_sharp),
      ),
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
