import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/features/login/presentation/login_screen.dart';
import 'package:samplestore/features/splash/splash_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
  ],
);
