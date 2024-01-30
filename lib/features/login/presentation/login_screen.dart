import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:samplestore/features/login/presentation/components/app_header.dart';
import 'package:samplestore/features/login/presentation/components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(signInOption: SignInOption.standard);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

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
                15.verticalSpace,
                const Text("OR"),
                15.verticalSpace,
                // with custom text
                Column(
                  children: [
                    SignInButton(
                      Buttons.google,
                      text: "Sign in with Google",
                      onPressed: () async {
                        try {
                          // await googleSignIn.disconnect();
                          final GoogleSignInAccount? googleSignInAccount =
                              await googleSignIn.signIn();
                          final GoogleSignInAuthentication? googleAuth =
                              await googleSignInAccount?.authentication;

                          final AuthCredential credential =
                              GoogleAuthProvider.credential(
                            accessToken: googleAuth?.accessToken,
                            idToken: googleAuth?.idToken,
                          );

                          final UserCredential authResult =
                              await _auth.signInWithCredential(credential);
                          final User? user = authResult.user;
                          print(user);

                          if (user != null) {
                            // Handle successful sign-in
                            print(user);
                            // Navigate to a different screen or perform other actions
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
