import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/features/login/presentation/login_screen.dart';
import 'package:samplestore/main_widget.dart';

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
          return const MainScreen(
            selectBtn: 0,
          );
        })
  ],
);
