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
  late Future<List<Ebook>> futureEbooks;

  @override
  void initState() {
    super.initState();
    futureEbooks = EbookService().fetchEbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ebook",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Ebook>>(
            future: futureEbooks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final List<Ebook> ebooksData = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 16.5 / 20,
                    children: List.generate(ebooksData.length, (index) {
                      final ebook = ebooksData[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  detailEbook(uuid: ebook.uuid),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 165,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'http://192.168.100.73:8888${ebook.thumbnail}',
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
              } else {
                return const Center(child: Text('No ebooks found'));
              }
            },
          ),
        ),
      ),
    );
  }
}
