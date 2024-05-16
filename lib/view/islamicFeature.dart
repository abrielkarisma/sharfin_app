import 'dart:ui';

import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sharfin_app/view/jamSholat.dart';
import 'package:sharfin_app/view/qiblaPage.dart';
import 'package:sharfin_app/view/quranPage.dart';
import 'package:sharfin_app/data/service/JamSholat.dart';

class IslamPage extends StatefulWidget {
  @override
  State<IslamPage> createState() => _IslamPageState();
}

class _IslamPageState extends State<IslamPage> {
  final prayerTimesService = PrayerTimesService();
  bool _isLoading = false;
  bool hasPermission = false;
  String? _locationError;

  Future<void> getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
        _fetchLocation();
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
          if (value == PermissionStatus.granted) {
            _fetchLocation();
          }
        });
      }
    } else {
      setState(() {
        _locationError = 'Location service is disabled.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  Future<void> fetchSholat(double latitude, double longitude) async {
    await prayerTimesService.getPrayerTimes(latitude: latitude, longitude: longitude);
    setState(() {
      _isLoading = false;
    });
  }

  void _handleRefresh() {
    if (!_isLoading) {
      _fetchLocation();
    }
  }

  Future<void> _fetchLocation() async {   
    setState(() {
      _isLoading = true;
    });

    // Check if location permission is granted
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        // Get device location
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        // Define latitude and longitude
        double latitude = position.latitude;
        double longitude = position.longitude;

        // Fetch prayer times for the obtained location
        await fetchSholat(latitude, longitude);

        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _locationError = "Failed to fetch location. Please try again.";
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _locationError = "Location permission denied.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'Fitur Islami',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff00a455),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              if (!_isLoading) {
                _handleRefresh();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff00a455),
                Color(0xff012011),
              ],
              stops: [
                0.25,
                0.45,
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('HH:mm').format(DateTime.now()),
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text(
                                      '(-${formatDuration(prayerTimesService.timeUntilNextPrayer)})',
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Waktu Adzan ${prayerTimesService.nextPrayerName}",
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                DateFormat('EEEE, dd MMM yyyy')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                HijriCalendar.now()
                                    .toFormat("dd MMMM yyyy" + " H"),
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 11),
                    child: IntrinsicWidth(
                      child: Container(
                        height: 26,
                        decoration: BoxDecoration(
                            color: Color(0xFF000000).withOpacity(0.25),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: Svg("assets/LocationWhite.svg"),
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  prayerTimesService.address,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  // Overflow handling if the text exceeds the container width
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/mosque2.png"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("container pressed");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildColumn(
                        screenWidth,
                        'assets/Jadwal Sholat.png',
                        "Jadwal Sholat",
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrayTime()));
                          // Add your logic here for Top up
                        },
                      ),
                      buildColumn(
                        screenWidth,
                        'assets/Masjid terdekat.png',
                        "Masjid Terdekat",
                        () {
                          print("Transfer tapped");
                          // Add your logic here for Transfer
                        },
                      ),
                      buildColumn(
                        screenWidth,
                        'assets/arah kiblat.png',
                        "Arah Kiblat",
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KiblatPage(),
                              ));
                          // Add your logic here for Tarik Tunai
                        },
                      ),
                      buildColumn(
                        screenWidth,
                        'assets/quran digital.png',
                        "Quran Digital",
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuranPage()));
                          // Add your logic here for Mutasi
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildColumn(
  double screenWidth,
  String imagePath,
  String text,
  VoidCallback onTap,
) {
  double imageSize = screenWidth > 600 ? 40 : 30;
  double containerHeight = screenWidth > 600 ? 60 : 50;
  double textSize = screenWidth > 600 ? 14 : 12;
  double paddingValue = screenWidth > 600 ? 20 : 10;

  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: containerHeight,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: paddingValue),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white),
          ),
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: textSize, color: Colors.white),
        )
      ],
    ),
  );
}
