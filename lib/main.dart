import 'package:flutter/material.dart';
import 'package:sharfin_app/view/detailInsight.dart';
import 'package:sharfin_app/view/insight.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/profilguest.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/view/others/syaratketentuan.dart';
import 'package:sharfin_app/widget/botNav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: detailInsight(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0XFF15AC97),
      ),
    );
  }
}
