import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:samplestore/core/storage/secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home screen")),
      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}
