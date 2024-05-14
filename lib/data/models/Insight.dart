import 'package:sharfin_app/data/models/Insight.dart';

class Insight {
  final String uuid;
  final String title;
  final String text;
  final List<String> img;

  const Insight({
    required this.uuid,
    required this.title,
    required this.text,
    required this.img,
  });

  factory Insight.fromJson(Map<String, dynamic> json) => Insight(
        uuid: json['uuid'] as String,
        title: json['title'] as String,
        text: json['text'] as String,
        img: List<String>.from(json['img']),
      );
}
