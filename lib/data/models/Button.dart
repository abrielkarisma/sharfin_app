// To parse this JSON data, do
//
//     final buttonApi = buttonApiFromJson(jsonString);

import 'dart:convert';
  
List<ButtonApi> buttonApiFromJson(String str) => List<ButtonApi>.from(json.decode(str).map((x) => ButtonApi.fromJson(x)));

String buttonApiToJson(List<ButtonApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ButtonApi {
    final String uuid;
    final String name;
    final String iconFile;

    ButtonApi({
        required this.uuid,
        required this.name,
        required this.iconFile,
    });

    factory ButtonApi.fromJson(Map<String, dynamic> json) => ButtonApi(
        uuid: json["uuid"],
        name: json["name"],
        iconFile: json["icon_file"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "icon_file": iconFile,
    };
}
