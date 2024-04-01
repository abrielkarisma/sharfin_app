import 'package:sharfin_app/data/models/Insight.dart';

class Ebook {
  final String id;
  final String title;
  final String about;
  final String content;
  final String image;

  const Ebook({
    required this.id,
    required this.title,
    required this.about,
    required this.content,
    required this.image,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) => Ebook(
        id: json['id'] as String,
        title: json['title'] as String,
        about: json['about'] as String,
        content: json['content'] as String,
        image: json['image'] as String,
      );
}
