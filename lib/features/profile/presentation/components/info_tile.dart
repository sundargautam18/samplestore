import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

Widget infoTiles(String title, String content) {
  return ListTile(
    leading: Icon(
      Icons.email,
      color: HexColor(primaryColor),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: HexColor(appGrey)),
        )
      ],
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
