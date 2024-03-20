import 'package:flutter/material.dart';
import 'package:sharfin_app/util/My_navbar.dart';
import 'package:sharfin_app/view/test.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0XFF14B5AE),
      ),
    );
  }
}
