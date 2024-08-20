import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final String? Function(String?)? validator;

  const EmailField({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.all(14),
        hintText: 'E-posta',
        hintStyle: TextStyle(color: Colors.black),
      ),
      validator: validator,
    );
  }
}
