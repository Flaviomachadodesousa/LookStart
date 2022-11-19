// ignore: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';
import 'package:lookstart/view/homescreen.dart';
import 'package:lookstart/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),
      body: Center(
        child: Image.asset(
          Constants.logo,
          width: 350.0,
          height: 250.0,
        ),
      ),
    );
  }
}
