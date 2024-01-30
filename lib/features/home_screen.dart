import 'package:flutter/material.dart';
import 'package:samplestore/core/common/app_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppLayout(
        body: Column(
          children: [Text("home")],
        ),
        title: "home");
  }
}
