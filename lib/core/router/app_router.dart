import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/features/login/presentation/login_screen.dart';

GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
  ],
);
