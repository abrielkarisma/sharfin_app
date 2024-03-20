import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/models/Insight.dart';
import 'package:sharfin_app/service/Insight.dart';
import 'package:sharfin_app/view/insight.dart';
import 'dart:io';

class detailInsight extends StatefulWidget {
  const detailInsight({super.key});

  @override
  State<detailInsight> createState() => _detailInsightState();
}

class _detailInsightState extends State<detailInsight> {
  Insight? insight;
  @override
  void initState() {
    super.initState();
    _getInsight();
  }

  _getInsight() async {
    final insightService = InsightService();
    try {
      final fetchedInsight = await insightService
          .getInsight("https://65fa56d03909a9a65b1a38a0.mockapi.io/Insight/1");
      setState(() {
        insight = fetchedInsight;
        print(fetchedInsight);
      });
    } catch (error) {
      print("Failed to fetch insight: $error");
      // Print more details if available
      if (error is SocketException) {
        print("SocketException: ${error.osError?.message}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(
            Icons.arrow_back,
            color: Color(0xFFA0A3BD),
          ),
          SizedBox(
            width: 40,
          ),
          Text(
            insight?.title ?? "",
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: insight == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Kejayaan Ekonomi Islam yang Tertutup Kabut Bernama Dark Age",
                      // insight!.title,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF14142B),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
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
                        Text("David Kendrick",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4E4B66),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      // "",
                      insight?.releaseDate?.toString() ?? "",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF15AC97),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(insight?.description ?? "",
                        // "Kejayaan Ekonomi Islam yang Tertutup Kabut Bernama Dark Age mengacu pada periode sejarah di mana peradaban Islam mencapai tingkat kemajuan ekonomi yang mengesankan, namun kemudian tertutup oleh masa Dark Age atau Zaman Gelap.",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4E4B66),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: SizedBox(
                      width: 343,
                      height: 415,
                      child: Image(
                        image: AssetImage("assets/examInsight.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
