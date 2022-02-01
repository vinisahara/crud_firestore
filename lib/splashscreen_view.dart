// ignore_for_file: use_key_in_widget_constructors, override_on_non_overriding_member, prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:crud_firestore/constants.dart';
// ignore: unused_import
import 'package:crud_firestore/login.dart';

import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 500.0,
          height: 500.0,
        ),
      ),
    );
  }
}
