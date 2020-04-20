import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:ciscosat/areas_page.dart';
import 'package:ciscosat/MainMenu.dart';
import 'package:flutter/material.dart';
import 'MainMenu.dart';
import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Starter())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/logo_with_name.png'),
      ),
    );
  }
}
