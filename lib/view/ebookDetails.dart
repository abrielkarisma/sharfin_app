import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/service/Ebook.dart';
import 'package:sharfin_app/view/ebookContent.dart';
import 'package:sharfin_app/view/test.dart';

class detailEbook extends StatefulWidget {
  const detailEbook({super.key, required this.uuid});
  final String uuid;

  @override
  State<detailEbook> createState() => _detailEbookState();
}

class _detailEbookState extends State<detailEbook> {
  late Future<Ebook> _ebookFuture;

  @override
  void initState() {
    super.initState();
    _ebookFuture = EbookService().getEbookByUUID(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: FutureBuilder<Ebook>(
          future: _ebookFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              Ebook ebook = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: const SizedBox(
                                width: 415,
                                child: Image(
                                  image: AssetImage("assets/Banner.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 60),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 60),
                                    child: Container(
                                      child: const SizedBox(
                                        width: 255,
                                        child: Text(
                                          "Detail Ebook",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 116),
                          child: SizedBox(
                            width: 160,
                            height: 200,
                            child: Image.network(
                              'http://192.168.100.86:8888${ebook.thumbnail}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                ebook.title,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF14142B),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 9.5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: const Image(
                                      image: AssetImage("assets/profunlog.png"),
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "David Kendrick",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4E4B66),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                ebook.title,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF15AC97),
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 363,
                                child: Text(
                                  ebook.description,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF14142B),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 24),
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EbookContent1(
                                        ebookUrl:
                                            'http://192.168.100.86:8888${ebook.ebookFile}',
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF15AC97)),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(171, 48)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Baca Sekarang",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFFFFFFF),
                                    height: 18 / 12,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
