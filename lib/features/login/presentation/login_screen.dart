import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:samplestore/features/login/presentation/components/app_header.dart';
import 'package:samplestore/features/login/presentation/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 375.w,
          height: 812.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appHeader(),
                15.verticalSpace,
                const LoginForm(),
              ],
            ),
          )),
    );
  }
}
