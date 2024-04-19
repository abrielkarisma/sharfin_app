// To parse this JSON data, do
//
//     final juz = juzFromJson(jsonString);

import 'dart:convert';

Juz juzFromJson(String str) => Juz.fromJson(json.decode(str));

String juzToJson(Juz data) => json.encode(data.toJson());

class Juz {
    final int code;
    final String status;
    final String message;
    final Data ops;

    Juz({
        required this.code,
        required this.status,
        required this.message,
        required this.ops,
    });

    factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        ops: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": ops.toJson(),
    };
}

class Data {
    final int juz;
    final int juzStartSurahNumber;
    final int juzEndSurahNumber;
    final String juzStartInfo;
    final String juzEndInfo;
    final int totalVerses;
    final List<Verse> verses;

    Data({
        required this.juz,
        required this.juzStartSurahNumber,
        required this.juzEndSurahNumber,
        required this.juzStartInfo,
        required this.juzEndInfo,
        required this.totalVerses,
        required this.verses,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        juz: json["juz"],
        juzStartSurahNumber: json["juzStartSurahNumber"],
        juzEndSurahNumber: json["juzEndSurahNumber"],
        juzStartInfo: json["juzStartInfo"],
        juzEndInfo: json["juzEndInfo"],
        totalVerses: json["totalVerses"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "juz": juz,
        "juzStartSurahNumber": juzStartSurahNumber,
        "juzEndSurahNumber": juzEndSurahNumber,
        "juzStartInfo": juzStartInfo,
        "juzEndInfo": juzEndInfo,
        "totalVerses": totalVerses,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
    };
}

class Verse {
    final Number number;
    final Meta meta;
    final Read text;
    final Translation translation;
    final Audio audio;
    final Tafsir tafsir;

    Verse({
        required this.number,
        required this.meta,
        required this.text,
        required this.translation,
        required this.audio,
        required this.tafsir,
    });

    factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: Number.fromJson(json["number"]),
        meta: Meta.fromJson(json["meta"]),
        text: Read.fromJson(json["text"]),
        translation: Translation.fromJson(json["translation"]),
        audio: Audio.fromJson(json["audio"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number.toJson(),
        "meta": meta.toJson(),
        "text": text.toJson(),
        "translation": translation.toJson(),
        "audio": audio.toJson(),
        "tafsir": tafsir.toJson(),
    };
}

class Audio {
    final String primary;
    final List<String> secondary;

    Audio({
        required this.primary,
        required this.secondary,
    });

    factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": List<dynamic>.from(secondary.map((x) => x)),
    };
}

class Meta {
    final int juz;
    final int page;
    final int manzil;
    final int ruku;
    final int hizbQuarter;
    final Sajda sajda;

    Meta({
        required this.juz,
        required this.page,
        required this.manzil,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: Sajda.fromJson(json["sajda"]),
    );

    Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda.toJson(),
    };
}

class Sajda {
    final bool recommended;
    final bool obligatory;

    Sajda({
        required this.recommended,
        required this.obligatory,
    });

    factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
    );

    Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
    };
}

class Number {
    final int inQuran;
    final int inSurah;

    Number({
        required this.inQuran,
        required this.inSurah,
    });

    factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
    );

    Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
    };
}

class Tafsir {
    final Id id;

    Tafsir({
        required this.id,
    });

    factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: Id.fromJson(json["id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id.toJson(),
    };
}

class Id {
    final String short;
    final String long;

    Id({
        required this.short,
        required this.long,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        short: json["short"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
    };
}

class Read {
    final String arab;
    final Transliteration transliteration;

    Read({
        required this.arab,
        required this.transliteration,
    });

    factory Read.fromJson(Map<String, dynamic> json) => Read(
        arab: json["arab"],
        transliteration: Transliteration.fromJson(json["transliteration"]),
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration.toJson(),
    };
}

class Transliteration {
    final String en;

    Transliteration({
        required this.en,
    });

    factory Transliteration.fromJson(Map<String, dynamic> json) => Transliteration(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Translation {
    final String en;
    final String id;

    Translation({
        required this.en,
        required this.id,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
    };
}
