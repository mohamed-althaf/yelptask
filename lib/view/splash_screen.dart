import 'package:flutter/material.dart';
import 'package:yelptask/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "images/background.png",
        fit: BoxFit.contain,
        scale: 2,
      )),
    );
  }
}
