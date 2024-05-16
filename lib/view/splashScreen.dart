import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sharfin_app/view/onboarding.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const onboarding()),
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
    return const Scaffold(
        backgroundColor: Color(0xFF14B5AE),
        body: Center(
          child: Image(
            image: AssetImage("assets/sharfin-logo.png"),
            width: 187,
            height: 43,
          ),
        ));
  }
}
