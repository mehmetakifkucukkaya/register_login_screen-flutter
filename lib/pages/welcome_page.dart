import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/app_strings.dart';
import 'package:login_signup/widgets/backgrond_image.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings().welcome,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 3,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Giriş Yap butonu
                  _buildButton(
                    context: context,
                    label: AppStrings().login,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    isOutlined: false,
                  ),
                  const SizedBox(height: 20),

                  // Kayıt Ol butonu
                  _buildButton(
                    context: context,
                    label: AppStrings().register,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    isOutlined: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required bool isOutlined,
  }) {
    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );

    return isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: buttonStyle.copyWith(
              side: WidgetStateProperty.all(
                const BorderSide(color: Colors.white, width: 2),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle.copyWith(
              foregroundColor: WidgetStateProperty.all(Colors.black),
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
          );
  }
}
