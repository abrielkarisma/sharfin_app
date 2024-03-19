import 'package:flutter/material.dart';

class insight extends StatefulWidget {
  const insight({super.key});

  @override
  State<insight> createState() => _insightState();
}

class _insightState extends State<insight> {
  final List<String> _imgIns = [
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
    "assets/examInsight.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Insight",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 16.5 / 20,
          children: List.generate(_imgIns.length, (index) {
            return GestureDetector(
              onTap: () {
                print("bisa cuy");
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: 165,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: AssetImage(_imgIns[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
