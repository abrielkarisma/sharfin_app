import 'package:sharfin_app/data/models/Insight.dart';

class Insight {
  final String id;
  final String title;
  final String description;
  final String image;

  const Insight({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Insight.fromJson(Map<String, dynamic> json) => Insight(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
      );
}
