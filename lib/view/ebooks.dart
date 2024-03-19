import 'package:flutter/material.dart';

class ebooks extends StatefulWidget {
  const ebooks({super.key});

  @override
  State<ebooks> createState() => _ebooksState();
}

class _ebooksState extends State<ebooks> {
  final List<String> _imgIns = [
    "assets/examEbook.png",
    "assets/examEbook.png",
    "assets/examEbook.png",
    "assets/examEbook.png",
    "assets/examEbook.png",
    "assets/examEbook.png",
    "assets/examEbook.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ebook",
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
