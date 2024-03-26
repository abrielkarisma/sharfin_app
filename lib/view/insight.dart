import 'package:flutter/material.dart';
import 'package:sharfin_app/models/Insight.dart';
import 'package:sharfin_app/service/Insight.dart';
import 'package:sharfin_app/view/detailInsight.dart';

class insight extends StatefulWidget {
  const insight({super.key});

  @override
  State<insight> createState() => _insightState();
}

class _insightState extends State<insight> {
  final Future<List<Insight>>? insights =
      InsightService.getImageInsight(); // Get insights

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Insight",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Insight>>(
          future: InsightService.getImageInsight(), // Use insights future
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Insight> insightsData = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 16.5 / 20,
                  children: List.generate(insightsData.length, (index) {
                    final insight = insightsData[index]; // Access insight data

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailInsight(
                                id: insight.id), // Pass ID directly
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
                                  insight
                                      .image, // Use image from Insight object
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
