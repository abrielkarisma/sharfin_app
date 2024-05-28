import 'dart:convert';

List<ButtonApi> buttonApiFromJson(String str) => List<ButtonApi>.from(json.decode(str).map((x) => ButtonApi.fromJson(x)));

String buttonApiToJson(List<ButtonApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ButtonApi {
  final String uuid;
  final String name;
  final String category;
  final String iconFile;

  ButtonApi({
    required this.uuid,
    required this.name,
    required this.category,
    required this.iconFile,
  });

  factory ButtonApi.fromJson(Map<String, dynamic> json) => ButtonApi(
    uuid: json["uuid"],
    name: json["name"],
    category: json["category"],
    iconFile: json["icon_file"],
  );

  // Method to get full URL
  String get fullIconUrl => 'http://192.168.100.73:8888$iconFile';

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "name": name,
    "category": category,
    "icon_file": iconFile,
  };
}
