import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplestore/core/config/app_bloc_observer_config.dart';
import 'package:samplestore/core/router/app_router.dart';
// import 'package:samplestore/core/utils/bloc_provider_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  // runApp(
  //   MultiBlocProvider(
  //     providers: blocProviderList,
  //     child: const MyApp(),
  //   ),
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Sample Store',
    );
  }
}
