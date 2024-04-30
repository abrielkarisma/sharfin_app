import 'package:flutter/material.dart';
import 'package:sharfin_app/data/service/JamSholat.dart';
import 'package:sharfin_app/widget/loading.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final prayerTimesService = PrayerTimesService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await prayerTimesService.getPrayerTimes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: isLoading
          ? loading()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prayerTimesService.address),
                    SizedBox(height: 16.0),
                    if (prayerTimesService.timeUntilNextPrayer.inSeconds > 0)
                      Text(
                        'Next Prayer: ${prayerTimesService.nextPrayerName} (${formatDuration(prayerTimesService.timeUntilNextPrayer)})',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    if (prayerTimesService.timeUntilNextPrayer.inSeconds <= 0)
                      Text(
                        'Next prayer has already passed. Please refer to prayer times for tomorrow.',
                        style: TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
