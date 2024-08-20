import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/app_strings.dart';
import 'package:login_signup/widgets/auth_form.dart';
import 'package:login_signup/widgets/backgrond_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKeyLogin = GlobalKey<FormState>();
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
              const Spacer(),
              Expanded(
                flex: 2,
                child: AuthForm(
                  formKey: _formKeyLogin,
                  button: _buildLoginButton(),
                  text: _buildRegisterRedirectText(),
                  title: 'Giriş Yapın',
                ),
              ),
            ],
          ),
        ],
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
        // Form doğrulama işlemimisz
        if (_formKeyLogin.currentState?.validate() ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Giriş başarılı!')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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

  Widget _buildRegisterRedirectText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Henüz Hesabınız yok mu?",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              AppStrings().register,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
