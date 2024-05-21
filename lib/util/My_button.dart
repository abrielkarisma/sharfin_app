<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Button.dart';

class MyButton extends StatelessWidget {
<<<<<<< Updated upstream
  final String iconImagePath;
  final String buttonText;

  const MyButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
  }) : super(key: key);
=======
  import 'dart:ffi';
=======
  final ButtonApi button;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.button,
    required this.onPressed,
  }) : super(key: key);
>>>>>>> Stashed changes

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
>>>>>>> Stashed changes

    @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;

<<<<<<< Updated upstream
    return Column(
      children: [
        GestureDetector(
<<<<<<< Updated upstream
          onTap: () { 
            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuPage()
                        ));
          },
          child: Container(
            height: screenWidth * 0.18, // Adjust height based on screen width
            margin: EdgeInsets.symmetric(
                horizontal:
                    screenWidth * 0.025), // Adjust margin based on screen width
            padding: EdgeInsets.all(
                screenWidth * 0.030), // Adjust padding based on screen width
=======
          onTap: onPressed,
          child: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2, // Adjust height based on screen width
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjust margin based on screen width
            padding: EdgeInsets.all(screenWidth * 0.045), // Adjust padding based on screen width
>>>>>>> Stashed changes
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  30), // Adjust borderRadius based on screen width
            ),
            child: Center(
<<<<<<< Updated upstream
              child: Image.asset(
                iconImagePath,
                height: screenWidth *
                    0.2, // Adjust image height based on screen width
=======
              child: Image.network(
                button.fullIconUrl,
                height: screenWidth * 0.1, // Adjust image height based on screen width
>>>>>>> Stashed changes
              ),
            ),
          ),
        ),
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        SizedBox(height: 3,),
        Text(
          buttonText,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          maxLines: 1, // Limits the text to one line
          overflow: TextOverflow
              .ellipsis, // Truncates the text with an ellipsis when it overflows // Adjust fontSize based on screen width
=======
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Adjust fontSize based on screen width
          ),
>>>>>>> Stashed changes
        )
=======
        SizedBox(height: screenWidth * 0.02), // Add space between the image and text
        Text(
          button.name,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // Adjust fontSize based on screen width
            fontWeight: FontWeight.w500,
          ),
        ),
>>>>>>> Stashed changes
      ],
    );
=======
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
>>>>>>> Stashed changes
  }
