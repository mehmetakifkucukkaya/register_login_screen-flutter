import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String? Function(String?)? validator;

  const PasswordField({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.all(14),
        hintText: 'Şifre',
        hintStyle: TextStyle(color: Colors.black),
      ),
      validator: validator,
    );
  }
}
