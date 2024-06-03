import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginAPI {
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
      'openid',
    ],
  );

  static Future<GoogleSignInAccount?> login() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print("Error during Google sign in: $error");
      return null;
    }
  }

  static Future signOut() => _googleSignIn.signOut();

  static Future<void> sendTokenToBackend(String idToken) async {
    try {
      var response = await Dio().post(
        'https://api.rumaloka.id/auth/google_mobile_callback',
        data: {'token': idToken},
      );

      if (response.statusCode == 200) {
        print("Token sent successfully");
      } else {
        print("Failed to send token. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending token: $e");
    }
  }

  static Future<String?> getIdToken() async {
    try {
      var user = await _googleSignIn.signInSilently();
      var auth = await user!.authentication;
      return auth?.idToken;
    } catch (error) {
      print("Error getting ID token: $error");
      return null;
    }
  }
}
