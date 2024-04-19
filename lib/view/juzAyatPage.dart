import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sharfin_app/data/models/juz_model.dart';

class JuzAyatPage extends StatefulWidget {
  final int? juzIndex;

  const JuzAyatPage({Key? key, required this.juzIndex}) : super(key: key);

  @override
  State<JuzAyatPage> createState() => _JuzAyatPageState();
}

class _JuzAyatPageState extends State<JuzAyatPage> {
  Future<Juz> _juzDetailSurah() async {
    // Check if juzIndex is not null
    if (widget.juzIndex != null) {
      var data = await Dio()
          .get("https://api.quran.gading.dev/juz/${widget.juzIndex}");
      print(data);
      return Juz.fromJson(json.decode(data.toString()));
    } else {
      // Handle the case when juzIndex is null
      throw Exception("Juz index is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use widget.juzIndex to fetch the relevant data for the juz
    return Scaffold(
      appBar: AppBar(
        title: Text('Juz ${widget.juzIndex}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        centerTitle: true,
      ),
      body: FutureBuilder<Juz>(
        future: _juzDetailSurah(),
        builder: ((context, snapshot) => ListView.builder(
              itemCount: snapshot.data?.ops.verses.length,
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show circular progress indicator while fetching data
                  return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  final juz = snapshot.data!.ops.verses[index];
                  return Card(
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                SvgPicture.asset('assets/border_nomer.svg'),
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: Center(
                                    child: Text(
                                      '${juz.number.inSurah}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffa0a3bd)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                                child: Text(
                              '${juz.text.arab}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )),
                          ],
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/border_nomer.svg',
                                  color: Colors.transparent,
                                ),
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: Center(
                                    child: Text(
                                      '${juz.number.inSurah}.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                              child: Text(
                            '${juz.translation.id} ',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.clip,
                          )),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                }
              },
            )),
        // Display juz-specific content here
      ),
    );
  }
}
