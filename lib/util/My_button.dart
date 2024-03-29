import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sharfin_app/view/semuaMenuPage.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final VoidCallback pathss;

  const MyButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    required this.pathss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: pathss,
          child: Container(
            height: screenWidth * 0.2, // Adjust height based on screen width
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjust margin based on screen width
            padding: EdgeInsets.all(screenWidth * 0.045), // Adjust padding based on screen width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), // Adjust borderRadius based on screen width
            ),
            child: Center(
              child: Image.asset(
                iconImagePath,
                height: screenWidth * 0.1, // Adjust image height based on screen width
              ),
            ),
          ),
        ),
        Text(
          buttonText,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Adjust fontSize based on screen width
        )
      ],
    );
  }
}
