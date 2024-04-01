import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/data/service/Insight.dart';

class detailInsight extends StatefulWidget {
  const detailInsight({super.key, required this.id});

  final String id;
  @override
  State<detailInsight> createState() => _detailInsightState();
}

class _detailInsightState extends State<detailInsight> {
  Insight? insight;

  @override
  void initState() {
    super.initState();
    final insightService = InsightService(); // Create instance
    _fetchData(insightService, widget.id); // Pass instance and ID
  }

  Future<void> _fetchData(InsightService insightService, String id) async {
    try {
      Insight? result = await insightService.getInsight(id); // Use string ID
      if (result != null) {
        setState(() {
          insight = result;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Insight",
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
            child: insight == null
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              insight!.title,
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
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              insight!.description,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4E4B66),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: SizedBox(
                                width: 343,
                                height: 415,
                                child: Image(
                                  image: AssetImage("assets/examInsight.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: SizedBox(
                                width: 343,
                                height: 415,
                                child: Image(
                                  image: AssetImage("assets/examInsight.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ]),
                  )));
  }
}
