import 'package:flutter/material.dart';

void main() {
  runApp(test());
}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insight Picture Preview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InsightPreviewPage(),
    );
  }
}

class InsightPreviewPage extends StatelessWidget {
  final List<String> insights = [
    'assets/Image.png',
    'assets/insight2.jpg',
    'assets/insight3.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insight Picture Preview'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var insight in insights)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Handle tap event, e.g., navigate to a detailed view
                },
                child: Card(
                  elevation: 4,
                  child: Image.asset(
                    insight,
                    fit: BoxFit.cover,
                    width: 80, // Adjust the width as needed
                    height: 80, // Adjust the height as needed
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle view more button press
              },
              child: Text('View More'),
            ),
          ),
        ],
      ),
    );
  }
}
