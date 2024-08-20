import 'package:flutter/material.dart';
import 'package:login_signup/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        // '/': (context) => const SplashScreen(),
        // '/welcome': (context) => const WelcomePage(),
        // '/login': (context) => const LoginPage(),
      },
    );
  }
}
