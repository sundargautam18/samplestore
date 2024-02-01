import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/core/localStorage/local_storage.dart';

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
          return FutureBuilder(
            future: AppLocalStorage.getNavigation(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return MainScreen(selectBtn: snapshot.data);
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        })
  ],
);
