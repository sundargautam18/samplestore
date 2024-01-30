import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    toolbarHeight: 100,
    title: Container(
      height: 46,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ConstantColors.neutralGrey,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 24,
            color: ConstantColors.primaryColor,
          ),
          SizedBox(width: 8),
          Text(
            "Search Proudct",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: ConstantColors.neutralGrey,
            ),
          ),
        ],
      ),
    ),
  );
}
