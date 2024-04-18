import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:sharfin_app/widget/loading.dart';

class PrayTime extends StatefulWidget {
  @override
  State<PrayTime> createState() => _PrayTimeState();
}

class _PrayTimeState extends State<PrayTime> {
  DateTime currentDate = DateTime.now();
  String subuh = "";
  String dhuhur = "";
  String ashar = "";
  String maghrib = "";
  String isya = "";
  String imsyak = "";
  String fajar = "";
  String address = "";
  String tanggal = "";
  final hijriyah = HijriCalendar.now();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrayerTimes(currentDate);
  }

  void getPrayerTimes(DateTime date) async {
    setState(() {
      isLoading = true;
    });
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double latitude = position.latitude;
    double longitude = position.longitude;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        address = "${place.subAdministrativeArea}, ${place.administrativeArea}";
      });
    } catch (error) {
      print("Error getting address: $error");
      // Handle the error appropriately, e.g., display a default message
      address = "Unknown Location";
    }

    tz.initializeTimeZones();
    String tzs = tzmap.latLngToTimezoneString(latitude, longitude);
    print(tzs);
    final location = tz.getLocation(tzs); // Replace with your location
    DateTime date = tz.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(latitude, longitude);
    CalculationParameters params = CalculationMethod.Singapore();
    PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);
    params.madhab = Madhab.Hanafi;
    setState(() {
      isLoading = false;
      subuh = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.fajr!, location))
          .toString();
      dhuhur = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.dhuhr!, location))
          .toString();
      ashar = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.asr!, location))
          .toString();
      maghrib = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.maghrib!, location))
          .toString();
      isya = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.isha!, location))
          .toString();
      fajar = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.sunrise!, location))
          .toString();
      imsyak = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(prayerTimes.fajrafter!, location))
          .toString();
      tanggal = DateFormat('EEEE, dd MMM yyyy').format(currentDate).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_sharp,
                size: 24,
                color: Color(0xFFA0A3BD),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12),
              width: 255,
              height: 25,
              child: Text(
                'Jadwal Sholat',
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF14142B),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: isLoading
                  ? loadingRed()
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: Svg("assets/Location.svg")),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(address,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF14142B),
                              )),
                        )
                      ],
                    ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF4E4B66),
                    ),
                    width: 343,
                    height: 71,
                  ),
                  Image(image: Svg("assets/Line.svg")),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentDate =
                                currentDate.subtract(Duration(days: 1));
                            getPrayerTimes(currentDate);
                            print(currentDate);
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: 200,
                        height: 39,
                        child: isLoading
                            ? Center(child: loadingWhite())
                            : Column(
                                children: [
                                  Text(
                                    tanggal,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    hijriyah.toFormat("dd MMMM yyyy" + " H"),
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentDate = currentDate.add(Duration(days: 1));
                            getPrayerTimes(currentDate);
                            print(currentDate);
                          });
                        },
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Imsak",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            imsyak,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Subuh",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            subuh,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Fajar",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            fajar,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Dzuhur",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            dhuhur,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Ashar",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            ashar,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Maghrib",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            maghrib,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Container(
              width: 343,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 291,
                    height: 21,
                    child: Text(
                      "Isya",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14142B),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: isLoading
                        ? loading()
                        : Text(
                            isya,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF15AC97),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
