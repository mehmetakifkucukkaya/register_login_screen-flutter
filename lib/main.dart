import 'package:flutter/material.dart';
import 'package:login_signup/pages/home_page.dart';
import 'package:login_signup/pages/login_page.dart';
import 'package:login_signup/pages/register_page.dart';
import 'package:login_signup/pages/splash_screen.dart';
import 'package:login_signup/pages/welcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
