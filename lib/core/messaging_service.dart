import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class MessagingService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    _fcm.requestPermission();
    print("working");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      if (message.notification != null) {
        print("Notification title: ${message.notification!.title}");
        print("Notification body: ${message.notification!.body}");
        // show a notification at top of screen.
        showSimpleNotification(Text(message.notification!.title.toString()),
            background: Colors.green);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessage: $message");
      if (message.notification != null) {
        print("Notification title: ${message.notification!.title}");
        print("Notification body: ${message.notification!.body}");
        // show a notification at top of screen.
        showSimpleNotification(Text(message.notification!.title.toString()),
            background: Colors.green);
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("onMessage: $message");
    if (message.notification != null) {
      print("Notification title: ${message.notification!.title}");
      print("Notification body: ${message.notification!.body}");
      // show a notification at top of screen.
      showSimpleNotification(Text(message.notification!.title.toString()),
          background: Colors.green);
    }
  }
}
