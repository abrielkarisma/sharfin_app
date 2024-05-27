import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/User.dart';
import 'package:url_launcher/url_launcher.dart';

class UserService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://192.168.100.73:8888/api/auth';

  Future<void> registerUser(User user) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/register',
        data: user.toJson(),
      );
      print(response
          .data); // Sesuaikan sesuai kebutuhan, misalnya menampilkan respons atau melakukan sesuatu setelah pendaftaran berhasil.
    } catch (error) {
      print('Error registering user: $error');
      throw Exception('Failed to register user');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data;
      } else {
        return {
          'message': 'An error occurred',
          'success': false,
        };
      }
    }
  }

  Future<void> googleLogin() async {
    try {
      var dio = Dio();
      var response = await dio.get('http://192.168.100.73/google_login');

      if (response.statusCode == 200) {
        var googleAuthUrl = response.data['url'];
      } else {
        print('Failed to login with Google: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error during Google login: $e');
    }
  }
}
