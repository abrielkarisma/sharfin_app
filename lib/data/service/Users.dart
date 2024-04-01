import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Users.dart';
import 'package:sharfin_app/view/profile.dart';

class UsersService {
  Future<Users?> getUsers(String id) async {
    try {
      var response = await Dio()
          .get("https://660a439e0f324a9a288471be.mockapi.io/users/$id");

      if (response.statusCode == 200) {
        return Users(
          id: response.data['id'],
          name: response.data['name'],
          avatar: response.data['avatar'],
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
