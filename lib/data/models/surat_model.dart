// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
    int number;
    int numberOfAyahs;
    String name;
    String translation;
    String revelation;
    String description;
    String audio;

    Surah({
        required this.number,
        required this.numberOfAyahs,
        required this.name,
        required this.translation,
        required this.revelation,
        required this.description,
        required this.audio,
    });

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        name: json["name"],
        translation: json["translation"],
        revelation: json["revelation"],
        description: json["description"],
        audio: json["audio"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "name": name,
        "translation": translation,
        "revelation": revelation,
        "description": description,
        "audio": audio,
    };
}
