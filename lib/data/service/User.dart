import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/User.dart';

class AuthService {
  Future<Response> register(User model) async {
    final dio = Dio();
    final data = model.toJson(); // Now includes 'name' property

    try {
      final response =
          await dio.post("https://reqres.in/api/register", data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
