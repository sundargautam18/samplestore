import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/features/home/presentation/ui/home_screen.dart';
import 'package:samplestore/features/login/presentation/login_screen.dart';

GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        })
  ],
);
