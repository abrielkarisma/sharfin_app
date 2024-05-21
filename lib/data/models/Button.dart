// To parse this JSON data, do
//
//     final buttonApi = buttonApiFromJson(jsonString);

import 'dart:convert';
<<<<<<< Updated upstream
  
=======

>>>>>>> Stashed changes
List<ButtonApi> buttonApiFromJson(String str) => List<ButtonApi>.from(json.decode(str).map((x) => ButtonApi.fromJson(x)));

String buttonApiToJson(List<ButtonApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ButtonApi {
    final String uuid;
    final String name;
<<<<<<< Updated upstream
=======
    final String category;
>>>>>>> Stashed changes
    final String iconFile;

    ButtonApi({
        required this.uuid,
        required this.name,
<<<<<<< Updated upstream
=======
        required this.category,
>>>>>>> Stashed changes
        required this.iconFile,
    });

    factory ButtonApi.fromJson(Map<String, dynamic> json) => ButtonApi(
        uuid: json["uuid"],
        name: json["name"],
<<<<<<< Updated upstream
        iconFile: json["icon_file"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "icon_file": iconFile,
    };
}
=======
        category: json["category"],
        iconFile: json["icon_file"],
    );
      String get fullIconUrl => 'http://192.168.136.249:8888$iconFile';
    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "category": category,
        "icon_file": iconFile,
    };
}

>>>>>>> Stashed changes
