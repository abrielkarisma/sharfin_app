import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/User.dart';

class UserService {
  final Dio _dio = Dio();

  Future<void> registerUser(User user) async {
    try {
      final response = await _dio.post(
        'http://192.168.1.14:8888/api/auth/register',
        data: user.toJson(),
      );
      print(response
          .data); // Ini bisa Anda sesuaikan dengan kebutuhan, misalnya menampilkan respons atau melakukan sesuatu setelah pendaftaran berhasil.
    } catch (error) {
      print('Error registering user: $error');
      throw Exception('Failed to register user');
    }
  }
}
