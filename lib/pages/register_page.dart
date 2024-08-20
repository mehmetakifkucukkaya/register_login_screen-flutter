import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/app_strings.dart';
import 'package:login_signup/pages/login_page.dart';
import 'package:login_signup/widgets/auth_form.dart';
import 'package:login_signup/widgets/backgrond_image.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKeyRegister = GlobalKey<FormState>();

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
                child: AuthForm(
                  formKey: _formKeyRegister,
                  button: _buildRegisterButton(),
                  text: _buildLoginRedirectText(context),
                  title: 'Kayıt Olun',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        // Form doğrulama işlemimiz
        if (_formKeyRegister.currentState?.validate() ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kayıt başarılı!')),
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
        AppStrings().register,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

Widget _buildLoginRedirectText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabınız zaten var mı?",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: Text(
            AppStrings().login,
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
