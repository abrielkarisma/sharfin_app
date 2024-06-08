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
}
