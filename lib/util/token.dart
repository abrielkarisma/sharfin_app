import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String getUsernameFromToken(String token) {
  try {
    final jwt = JWT.verify(token,
        SecretKey('secret')); // Ganti 'secret_key' dengan kunci rahasia Anda
    print('Payload: ${jwt.payload}');
    return jwt.payload['name']; // Sesuaikan dengan struktur payload Anda
  } catch (e) {
    print('Error verifying token: $e');
    return '';
  }
}
