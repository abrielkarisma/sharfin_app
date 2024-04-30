import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sharfin_app/view/others/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => onboarding()),
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF14B5AE),
      body: Center(
        child: Image(
          image: AssetImage("assets/sharfin-logo.png"),
          width: screenWidth * 0.8, // 80% of screen width
          height: screenWidth * 0.19, // 19% of screen width
        ),
      ),
    );
  }
}
