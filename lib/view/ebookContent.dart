import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/service/Ebook.dart';

class ebookContent extends StatefulWidget {
  final String id;

  const ebookContent({super.key, required this.id});

  @override
  State<ebookContent> createState() => _ebookContentState();
}

class _ebookContentState extends State<ebookContent> {
  Ebook? ebook;

  @override
  void initState() {
    super.initState();
    final ebookService = EbookService(); // Create instance
    _fetchData(ebookService, widget.id); // Pass instance and ID
  }

  Future<void> _fetchData(EbookService ebookService, String id) async {
    try {
      Ebook? result = await ebookService.getEbook(id); // Use string ID
      if (result != null) {
        setState(() {
          ebook = result;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: 415,
                height: 519,
                child: Image(
                  image: AssetImage("assets/examEbook.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  ebook!.content +
                      ebook!.content +
                      ebook!.content +
                      ebook!.content,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF14142B),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
