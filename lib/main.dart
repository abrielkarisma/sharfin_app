import 'package:flutter/material.dart';
import 'package:sharfin_app/view/ebookContent.dart';
import 'package:sharfin_app/view/ebookDetails.dart';
import 'package:sharfin_app/view/insightDetails.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/insight.dart';
import 'package:sharfin_app/view/islamicFeature.dart';
import 'package:sharfin_app/view/jamSholat.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/profile.dart';
import 'package:sharfin_app/view/profileGuest.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/view/others/syaratKetentuan.dart';
import 'package:sharfin_app/widget/botNav.dart';
import 'package:sharfin_app/view/ebooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IslamPage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorSchemeSeed: Color(0XFF15AC97),
      ),
    );
  }
}
