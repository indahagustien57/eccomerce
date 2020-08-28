import 'dart:async';

import 'package:flutter/material.dart';
import 'package:eccomerce/page_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/splashawal.png"),
          fit: BoxFit.cover,
        )),
      )),
    );
  }

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5), onDone);
  }

  void onDone() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => PageLogin()));
  }
}
