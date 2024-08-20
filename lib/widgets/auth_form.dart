import 'package:flutter/material.dart';
import 'package:login_signup/core/validators/auth_validator.dart';
import 'package:login_signup/widgets/email_field.dart';
import 'package:login_signup/widgets/password_field.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Widget button;
  final Widget text;

  final String? title;

  const AuthForm({
    super.key,
    required this.formKey,
    required this.button,
    this.text = const SizedBox(),
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  //* title null ise boş bir string dönüdüyprz
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 40),
                const EmailField(
                  validator: AuthValidator.validateEmail,
                ),
                const SizedBox(height: 14),
                const PasswordField(
                  validator: AuthValidator.validatePassword,
                ),
                const SizedBox(height: 20),

                // dışarıdan gelecek olan buton widgeti
                button,
                text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
