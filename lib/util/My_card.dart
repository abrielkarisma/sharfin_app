import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
 final String iconImagePath;

  const MyCard ({
    Key? key, 
required this.iconImagePath,
  }) : super(key :key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),),
        child: Image.asset(iconImagePath, fit: BoxFit.contain,),
      ),
    );
  }
}