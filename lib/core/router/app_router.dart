import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/core/storage/secure_storage.dart';
import 'package:samplestore/features/home_screen.dart';

import 'package:samplestore/features/login/presentation/login_screen.dart';
import 'package:samplestore/features/profile/presentation/profile_screen.dart';
import 'package:samplestore/features/splash/splash_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: "/",
  redirect: (BuildContext context, GoRouterState state) async {
    SecureStorage secureStorage = SecureStorage();

    final isLoggedIn = await secureStorage.readSecureData("accessToken");

    if (isLoggedIn.isNotEmpty && state.fullPath != "/") {
      return null;
    }
    if (isLoggedIn.isNotEmpty) {
      return "/";
    } else {
      return "/login";
    }
  },
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        }),
    GoRoute(
        path: '/offers',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
  ],
);
