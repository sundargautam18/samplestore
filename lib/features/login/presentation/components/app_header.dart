import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

Column appHeader() {
  return Column(
    children: [
      Container(
        alignment: Alignment.center, // use aligment
        height: 72,
        width: 72,
        child: Image.asset('assets/images/logo2.png', fit: BoxFit.cover),
      ),
      const SizedBox(
        height: 15,
      ),
      Column(
        children: [
          const Text(
            "Welcome to hamro pasal",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: HexColor(appGrey), fontSize: 12),
          ),
        ],
      ),
    ],
  );
}
