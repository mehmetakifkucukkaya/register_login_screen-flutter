import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/app_strings.dart';
import 'package:login_signup/core/validators/auth_validator.dart';
import 'package:login_signup/widgets/backgrond_image.dart';
import 'package:login_signup/widgets/email_field.dart';
import 'package:login_signup/widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgrondImage(),
          Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildLoginForm(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Giriş Yapın",
                  style: TextStyle(
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
                const SizedBox(height: 25),
                _buildRememberMeAndForgotPassword(),
                const SizedBox(height: 20),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      children: [
        Checkbox(
          value: _isRememberMeChecked,
          onChanged: (bool? value) {
            setState(() {
              _isRememberMeChecked = value ?? false;
            });
          },
        ),
        Text(
          AppStrings().rememberMe,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
          onPressed: () {},
          child: Text(
            AppStrings().forgetPass,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // Form doğrulama işlemi
        if (_formKey.currentState?.validate() ?? false) {
          // Doğrulama başarılı, giriş işlemini gerçekleştir
          // Buraya giriş işlemleri kodunu ekleyebilirsiniz
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Giriş başarılı!')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        AppStrings().login,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
