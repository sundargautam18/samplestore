import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samplestore/core/bloc/bloc_provider_list.dart';
import 'package:samplestore/core/router/app_router.dart';
import 'package:samplestore/core/theme/app_theme.dart';
import 'package:samplestore/firebase_options.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await configure();
  runApp(MultiBlocProvider(providers: blocProviderList, child: const MyApp()));
}

Future<void> configure() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
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
          routerConfig: appRouter,
          theme: appThemeData(context),
        );
      },
    );
  }
}
