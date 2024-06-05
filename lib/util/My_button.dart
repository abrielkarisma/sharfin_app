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

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: screenWidth * 0.2, // Constrain the width
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: GestureDetector(
              onTap: onPressed,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.18,
                    height: screenWidth * 0.18,
                    padding: EdgeInsets.all(screenWidth * 0.045),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: button.isLocal
                          ? Image.asset(
                              button.iconFile,
                              height: screenWidth * 0.2,
                            )
                          : Image.network(
                              button.fullIconUrl,
                              height: screenWidth * 0.2,
                            ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Expanded(
                    flex: 0,
                    child: Text(
                      button.name,
                      maxLines: 2,
                      softWrap: true, // Allow text to wrap
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
