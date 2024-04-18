import 'package:flutter/material.dart';

class KiblatPage extends StatefulWidget {
  const KiblatPage({Key? key}) : super(key: key);

  @override
  State<KiblatPage> createState() => _KiblatPageState();
}

class _KiblatPageState extends State<KiblatPage> {
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
      body: Center(),
    );
  }
}
