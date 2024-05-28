import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/button.dart';

class MyButton extends StatelessWidget {
  final ButtonApi button;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.button,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            padding: EdgeInsets.all(screenWidth * 0.045),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Image.network(
                button.fullIconUrl,
                height: screenWidth * 0.1,
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          button.name,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
