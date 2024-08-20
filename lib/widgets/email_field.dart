import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/app_strings.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: const EdgeInsets.all(14),
        hintText: AppStrings().email,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
