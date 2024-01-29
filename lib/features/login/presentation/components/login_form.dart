import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: "email",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? HexColor(primaryColor)
                          : Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor(primaryColor), width: 2.0),
                  ),
                  hintText: "Enter email or username"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Email is required.'),
                FormBuilderValidators.email(
                    errorText: 'Enter valid email address.'),
              ]),
            ),
            15.verticalSpace,
            FormBuilderTextField(
              name: "Password",
              obscureText: _obscureText,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Password is required.'),
              ]),
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: _toggle,
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? HexColor(primaryColor)
                          : Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor(primaryColor), width: 2.0),
                  ),
                  hintText: "Enter password"),
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: HexColor(primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.saveAndValidate()) {
                            // Form is validated
                            print(formKey.currentState!.value);
                          } else {
                            // Form is not validated
                            print('Form is not valid');
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        )))
              ],
            )
          ],
        ));
  }
}
