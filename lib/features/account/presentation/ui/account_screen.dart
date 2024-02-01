import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _appBar(context),
          ],
        ),
      ),
    );
  }
}

Widget _appBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: ConstantColors.neutralLight,
        ),
      ),
    ),
    child: const Text(
      "Account",
      style: TextStyle(
        color: ConstantColors.neutralDark,
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
