import 'package:flutter/material.dart';
import 'package:sharfin_app/view/islamicFeature.dart';

class MasjidNearby extends StatelessWidget {
  final List<Map<String, String>> masjids = [
    {'name': 'Masjid As Syuhada', 'distance': '150m'},
    {'name': 'Masjid Al Ikhlas', 'distance': '1.50km'},
    {'name': 'Masjid Istiqlal', 'distance': '2.50km'},
    {'name': 'Masjid Al Amin', 'distance': '2.74km'},
    {'name': 'Masjid Jami’ Malik', 'distance': '3.24km'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Masjid Terdekat',
        style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: ListView.builder(
        itemCount: masjids.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(masjids[index]['name']!),
            subtitle: Text(masjids[index]['distance']!, style: TextStyle(color: Colors.grey),),
            trailing: Icon(Icons.location_pin), iconColor: Colors.grey,
          );
        },
      ),
    );
  }
}
