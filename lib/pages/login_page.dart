import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
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
        _buildText(AppStrings().rememberMe, fontWeight: FontWeight.w600),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
          onPressed: () {},
          child: _buildText(AppStrings().forgetPass),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKeyLogin.currentState?.validate() ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Giriş başarılı!')),
          );

          Navigator.pushNamed(context, '/home');
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: _buildText(AppStrings().login, fontSize: 18),
    );
  }

  Widget _buildRegisterRedirectText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildOtherLogins(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText("Henüz Hesabınız yok mu?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: _buildText(AppStrings().register, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtherLogins() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Brand(Brands.facebook, size: 40),
          Brand(Brands.google, size: 40),
          Brand(Brands.twitter, size: 40),
        ],
      ),
    );
  }

  Text _buildText(String text,
      {double fontSize = 16, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.grey[700],
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
