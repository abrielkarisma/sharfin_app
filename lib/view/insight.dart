import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Insight.dart'; // Ubah nama file Insight.dart menjadi insight.dart
import 'package:sharfin_app/data/service/Insight.dart'; // Ubah nama file Insight.dart menjadi insight.dart
import 'package:sharfin_app/view/detailInsight.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  late Future<List<Insight>> _insightsFuture;
  final InsightService _insightService = InsightService();

  @override
  void initState() {
    super.initState();
    _insightsFuture = InsightService.getImageInsights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Insight",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Insight>>(
          future: _insightsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<Insight> insights = snapshot.data ?? [];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 16.5 / 20,
                  children: List.generate(insights.length, (index) {
                    Insight insight = insights[index];
                    String imageUrl =
                        "http://192.168.1.126:8888${insight.img.first}";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailInsight(uuid: insight.uuid),
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
                                  imageUrl,
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
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
