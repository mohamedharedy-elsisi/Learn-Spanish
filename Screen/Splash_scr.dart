import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/Login.dart';
import '../Auth/Register.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> checkRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('remember_me') ?? false;
    await Future.delayed(Duration(seconds: 4));
    if (rememberMe) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Register()),
      );

    }
  }

  @override
  void initState() {
    super.initState();
    checkRememberMe();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/Translation.json',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
