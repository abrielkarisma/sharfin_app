import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/data/service/Insight.dart';

class DetailInsight extends StatefulWidget {
  final String uuid;

  const DetailInsight({Key? key, required this.uuid}) : super(key: key);

  @override
  _DetailInsightState createState() => _DetailInsightState();
}

class _DetailInsightState extends State<DetailInsight> {
  late Future<Insight> _insightFuture;

  @override
  void initState() {
    super.initState();
    _insightFuture = InsightService.getInsightByUUID(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Insight",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<Insight>(
        future: _insightFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Insight insight = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    insight.title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF14142B),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "assets/profunlog.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                      SizedBox(width: 8),
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
                  SizedBox(height: 8),
                  Text(
                    insight.text,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: insight.img.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            "http://192.168.1.14:8888${insight.img[index]}"),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
