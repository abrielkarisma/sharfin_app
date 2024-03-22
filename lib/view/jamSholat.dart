import 'package:flutter/material.dart';

class PrayTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Sholat', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text('You are on the Profile Page.'),
      ),
    );
  }
}