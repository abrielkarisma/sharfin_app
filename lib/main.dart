import 'package:flutter/material.dart';
import 'package:sharfin_app/cancel/onBoarding.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0XFF15AC97),
      ),
    );
  }
}
