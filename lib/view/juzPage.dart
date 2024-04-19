import "dart:convert";
import 'package:http/http.dart' as http;
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:sharfin_app/data/models/juz_model.dart";
import "package:sharfin_app/view/juzAyatPage.dart";
class JuzPage extends StatefulWidget {
  const JuzPage({Key? key});

  @override
  State<JuzPage> createState() => _JuzPageState();
}

class _JuzPageState extends State<JuzPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'items': [
        {'text': 'Al-Fatihah Ayat 1'},
        {'text': 'Al-Baqarah Ayat 142 '},
        {'text': 'Al-Baqarah Ayat 253'},
        {'text': 'Ali Imran Ayat 93'},
        {'text': 'Surat An-Nisa 24'},
        {'text': 'Surat An-Nisa 148'},
        {'text': 'Al-Maidah Ayat 83'},
        {'text': 'Al-Anam Ayat 111'},
        {'text': 'Al-Araf Ayat 88'},
        {'text': 'Al-Anfal Ayat 41'},
        {'text': 'At-Taubah Ayat 93'},
        {'text': 'Hud Ayat 6'},
        {'text': 'Yusuf Ayat 53'},
        {'text': 'Al-Hijr Ayat 1'},
        {'text': 'Al-Isra Ayat 1'},
        {'text': 'Al-Kahf Ayat 75'},
        {'text': 'Al-Anbiya Ayat 1'},
        {'text': 'Al-Muminun Ayat 1'},
        {'text': 'Al-Furqan Ayat 21'},
        {'text': 'An-Naml Ayat 56'}, 
        {'text': 'Al-Ankabut Ayat 46'},
        {'text': 'Al-Ahzab Ayat 31'},
        {'text': 'Yasin Ayat 28'},
        {'text': 'Az-Zumar Ayat 32'},
        {'text': 'Fussilat Ayat 47'},
        {'text': 'Al-Ahqaf Ayat 1'},
        {'text': 'Adz Dzariyat Ayat 31'},
        {'text': 'Al-Mujadilah Ayat 1'},
        {'text': 'Al-Mulk Ayat 1'},
        {'text': 'An-Naba Ayat 1'},  
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          final categoryIndex = index % categories.length;
          final itemIndex = index % categories[categoryIndex]['items'].length;
          final item = categories[categoryIndex]['items'][itemIndex];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JuzAyatPage(juzIndex: index + 1),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              child: ListTile(
                tileColor: Colors.white,
                leading: Stack(
                  children: [
                    SvgPicture.asset('assets/border_nomer.svg'),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffa0a3bd)),
                        ),
                      ),
                    )
                  ],
                ),
                title: Text(
                  'Juz ${index + 1}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(item['text'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffa0a3bd)), ), // Display text from the 'items' list
              ),
            ),
          );
        },
      ),
    );
  }
}
