import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samplestore/core/app_pathprovider.dart';
import 'package:samplestore/core/bloc/bloc_observer.dart';
import 'package:samplestore/core/bloc/bloc_provider_list.dart';
import 'package:samplestore/core/injection/injection_container.dart';
import 'package:samplestore/core/router/app_router.dart';
import 'package:samplestore/core/theme/app_theme.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:samplestore/firebase_options.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samplestore/hive/hive_manager.dart';

// overlay entry point
@pragma("vm:entry-point")
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPathProvider.initPath();

  setup();
  Bloc.observer = const AppBlocObserver();
  await GetStorage.init();
  await configure();
  runApp(MultiBlocProvider(
      providers: blocProviderList,
      child: const OverlaySupport.global(child:  MyApp())));
}

Future<void> configure() async {
  await HiveManager().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCMToken $fcmToken");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: appThemeData(context),
        );
      },
    );
  }
}
