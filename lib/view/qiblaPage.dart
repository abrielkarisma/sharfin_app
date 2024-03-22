import 'package:flutter/material.dart';
// Import Smooth Compass package

class KiblatPage extends StatelessWidget {
  const KiblatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arah Kiblat',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
      ),
    );
  }
}
