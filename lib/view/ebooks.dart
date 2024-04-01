import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/service/Ebook.dart';
import 'package:sharfin_app/view/ebookDetails.dart';

class ebooks extends StatefulWidget {
  const ebooks({super.key});

  @override
  State<ebooks> createState() => _ebooksState();
}

class _ebooksState extends State<ebooks> {
  final Future<List<Ebook>>? ebooks =
      EbookService.getImageEbook(); // Get insights

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
      body: Center(
        child: FutureBuilder<List<Ebook>>(
          future: EbookService.getImageEbook(), // Use insights future
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Ebook> ebooksData = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 16.5 / 20,
                  children: List.generate(ebooksData.length, (index) {
                    final ebook = ebooksData[index]; // Access insight data

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                detailEbook(id: ebook.id), // Pass ID directly
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: 165,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  ebook.image, // Use image from Insight object
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
