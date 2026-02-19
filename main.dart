import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/Home.dart';
import 'Screen/Splash_scr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: login(),
      // home: register_screen(),
      //  home: forget_password(),
      home: SplashScreen(),
    );
  }
}