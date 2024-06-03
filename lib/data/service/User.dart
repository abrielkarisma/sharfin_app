import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/User.dart';
import 'package:url_launcher/url_launcher.dart';

class UserService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.rumaloka.id/api/auth';

  Future<void> registerUser(User user) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/register',
        data: user.toJson(),
      );
      print(response.data);
    } catch (error) {
      print('Error registering user: $error');
      throw Exception('Failed to register user');
    }
  }

  Future<void> registerGoogle(String name, String email, String password,
      Future<Null> Function(String? token, String? error) param3) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/google_login',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      print(response.data);
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

  Future<Map<String, dynamic>> checkEmail(String email) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login',
        data: {
          'email': email,
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
}
