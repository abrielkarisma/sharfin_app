import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/service/Ebook.dart';
import 'package:sharfin_app/view/ebookContent.dart';

class detailEbook extends StatefulWidget {
  const detailEbook({super.key, required this.id});

  final String id;
  @override
  State<detailEbook> createState() => _detailEbookState();
}

class _detailEbookState extends State<detailEbook> {
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

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(0),
      child: ebook == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: SizedBox(
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
                                  padding: EdgeInsets.only(left: 16, top: 60),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 12, top: 60),
                                  child: Container(
                                    child: SizedBox(
                                      width: 255,
                                      child: Text(
                                        "Detail Ebook",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 116),
                        child: SizedBox(
                            width: 160,
                            height: 200,
                            child:
                                Image.network(ebook!.image, fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              ebook!.title,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF14142B),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 9.5),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image(
                                    image: AssetImage("assets/profunlog.png"),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "David Kendrick",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4E4B66),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              "",
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
                                ebook!.about,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF14142B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 24),
                            child: FilledButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ebookContent(
                                          id: widget.id), // Pass the id here
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF15AC97)), // Adjust color
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.white), // Adjust text color
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10)), // Adjust padding
                                  minimumSize:
                                      MaterialStateProperty.all(Size(171, 48)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Adjust radius as desired
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Baca Sekarang",
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFFFFFFF),
                                    height: 18 / 12,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
    ));
  }
}