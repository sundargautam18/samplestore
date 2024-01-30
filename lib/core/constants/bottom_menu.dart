import 'package:flutter/material.dart';

class ButtonItems {
  final String name;
  final Widget icon;
  final String route;
  ButtonItems({required this.name, required this.route, required this.icon});
}

List<ButtonItems> bottomMenus = [
  ButtonItems(
      name: "Home",
      route: "/",
      icon: const Icon(
        Icons.home,
      )),
  ButtonItems(
      name: "Explore",
      route: "/explore",
      icon: const Icon(
        Icons.search,
      )),
  ButtonItems(
      name: "Cart",
      route: "/cart",
      icon: const Icon(
        Icons.shopping_basket,
      )),
  ButtonItems(
      name: "Offers",
      route: "/offers",
      icon: const Icon(
        Icons.tag,
      )),
  ButtonItems(
      name: "Account",
      route: "/profile",
      icon: const Icon(
        Icons.person,
      )),
];
