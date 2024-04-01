import 'package:sharfin_app/data/models/Users.dart';

class Users {
  final String id;
  final String name;
  final String avatar;

  const Users({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json['id'] as String,
        name: json['name'] as String,
        avatar: json['avatar'] as String,
      );
}
