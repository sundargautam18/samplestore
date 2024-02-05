import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:samplestore/core/storage/secure_storage.dart';
import 'package:samplestore/features/profile/presentation/components/info_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, String>> items = [
    {"title": "Gender", "content": "Male"},
    {"title": "Phone Number", "content": "+9779824961070"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle
                      // Adjust the radius as needed
                      ),
                  child: Image.network(
                    "https://cdn-icons-png.freepik.com/512/3135/3135715.png",
                    fit: BoxFit.cover,
                  ),
                ),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sample Bahadur Sarkar",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "samplestore@gmail.com",
                      style:
                          TextStyle(fontSize: 14.sp, color: HexColor(appGrey)),
                    ),
                  ],
                )
              ],
            ),
            40.verticalSpace,
            ...items.map((item) {
              return infoTiles(
                  item['title'].toString(), item['content'].toString());
            }),
            MaterialButton(
              onPressed: () async {
                SecureStorage secureStorage = SecureStorage();

                FirebaseAuth.instance
                    .signOut(); // this FirebaseAuth is not a await function so you can skip that
                await GoogleSignIn().signOut();
                secureStorage.deleteSecureData("accessToken");
                if (!context.mounted) return;
                Alert(
                        context: context,
                        title: "See you soon !!",
                        buttons: [],
                        type: AlertType.success)
                    .show();
                Timer(const Duration(seconds: 1), () {
                  context.go("/logout");
                });
              },
              child: const Text("Logout"),
            ),
            TextButton.icon(
                onPressed: () => context.goNamed("create-review"),
                icon: Icon(Icons.reviews),
                label: const Text("Write Review"))
          ],
        ),
      ),
    );
  }
}
