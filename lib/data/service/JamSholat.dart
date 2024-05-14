import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class PrayerTimesService {
  final _currentDate = DateTime.now();
  String _address = "";
  String _tanggal = "";
  final hijriyah = HijriCalendar.now();
  String _nextPrayerName = "";
  Duration _timeUntilNextPrayer = Duration.zero;

  Future<void> getPrayerTimes() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      _address = "${place.subAdministrativeArea}, ${place.administrativeArea}";
    } catch (error) {
      print("Error getting address: $error");
      // Handle the error appropriately, e.g., display a default message
      _address = "Unknown Location";
    }

    tz.initializeTimeZones();
    String tzs = tzmap.latLngToTimezoneString(latitude, longitude);
    final location = tz.getLocation(tzs); // Replace with your location
    DateTime date = tz.TZDateTime.from(_currentDate, location);
    Coordinates coordinates = Coordinates(latitude, longitude);
    CalculationParameters params = CalculationMethod.Singapore();
    params.madhab = Madhab.Shafi;
    PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);

    _tanggal = DateFormat('EEEE, dd MMM yyyy').format(_currentDate).toString();

    // Calculate time until next prayer
    List<Prayer> allPrayers = [
      Prayer(name: "Subuh", time: prayerTimes.fajr!),
      Prayer(name: "Dhuhur", time: prayerTimes.dhuhr!),
      Prayer(name: "Asar", time: prayerTimes.asr!),
      Prayer(name: "Maghrib", time: prayerTimes.maghrib!),
      Prayer(name: "Isya", time: prayerTimes.isha!),
    ];

    allPrayers.sort((a, b) => a.time!.compareTo(b.time!));

    int currentPrayerIndex = 0;
    for (int i = 0; i < allPrayers.length; i++) {
      if (allPrayers[i]
          .time!
          .isAfter(tz.TZDateTime.from(_currentDate, location))) {
        currentPrayerIndex = i;
        break;
      }
    }

    Prayer nextPrayer = allPrayers[currentPrayerIndex];
    DateTime now = tz.TZDateTime.from(_currentDate, location);
    _timeUntilNextPrayer = nextPrayer.time!.difference(now);

    _nextPrayerName = allPrayers[currentPrayerIndex].name!;
  }

  String get address => _address;
  String get tanggal => _tanggal;
  String get nextPrayerName => _nextPrayerName;
  Duration get timeUntilNextPrayer => _timeUntilNextPrayer;
}

class Prayer {
  final String name;
  final DateTime? time;

  Prayer({required this.name, this.time});
}

String formatDuration(Duration duration) {
  String hours = duration.inHours.toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  return '$hours:$minutes';
}
