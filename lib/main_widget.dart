import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';
import 'package:samplestore/features/account/presentation/ui/account_screen.dart';
import 'package:samplestore/features/cart/presentation/ui/cart_screen.dart';
import 'package:samplestore/features/explore/presentation/ui/explore_screen.dart';
import 'package:samplestore/features/home/presentation/ui/home_screen.dart';
import 'package:samplestore/features/offer/presentation/ui/offer_screen.dart';

class MainScreen extends StatefulWidget {
  final int selectBtn;
  const MainScreen({super.key, required this.selectBtn});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex = widget.selectBtn;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const OfferScreen(),
    const AccountScreen(),
  ];
  final _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      label: "Explore",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: "Cart",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_offer_outlined),
      label: "Offer",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: "Account",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 93,
        width: MediaQuery.of(context).size.width,
        child: BottomNavigationBar(
          selectedItemColor: ConstantColors.primaryColor,
          iconSize: 24,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
            fontSize: 10,
            height: 2,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 2,
          ),
          items: _items,
          onTap: (index) {
            navigatorKey.currentState?.maybePop();
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
