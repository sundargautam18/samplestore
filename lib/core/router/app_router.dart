import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:samplestore/core/storage/secure_storage.dart';
import 'package:samplestore/features/animation/cubit_example.dart';
import 'package:samplestore/features/flashsales/presentation/flashsale_screen.dart';
import 'package:samplestore/features/home_screen.dart';

import 'package:samplestore/features/login/presentation/login_screen.dart';
import 'package:samplestore/features/product/presentation/product_screen.dart';
import 'package:samplestore/features/profile/presentation/profile_screen.dart';
import 'package:samplestore/features/review_create.dart';
import 'package:samplestore/features/search/app_search.dart';
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
        routes: [
          GoRoute(
              path: 'product/:id',
              builder: (BuildContext context, GoRouterState state) {
                final path = state.pathParameters["id"] ?? "";
                return ProductScreen(
                  productName: path,
                );
              }),
          GoRoute(
              path: 'flashsales',
              builder: (BuildContext context, GoRouterState state) {
                return const FlashSales();
              }),
          GoRoute(
              path: 'cubitexample',
              name: "cubitexample",
              builder: (BuildContext context, GoRouterState state) {
                return const CubitExample();
              }),
          GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileScreen();
              }),
          GoRoute(
              path: 'create-review',
              name: "create-review",
              builder: (BuildContext context, GoRouterState state) {
                return const CreateReview();
              }),
          GoRoute(
              path: 'search',
              builder: (BuildContext context, GoRouterState state) {
                final path = state.uri.queryParameters["name"] ?? "all";
                return AppSearch(
                  query: path,
                );
              }),
        ],
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
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
