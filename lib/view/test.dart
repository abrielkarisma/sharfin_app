import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:sharfin_app/data/service/Google.dart';

class login extends StatefulWidget {
  const login($, {super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var user = await LoginAPI.login();
            if (user != null) {
              var auth = await user.authentication;
              String? idToken = auth.idToken;
              String? accessToken = auth.accessToken;

              if (idToken == null) {
                // Dapatkan ID Token manual
                idToken = await LoginAPI.getIdToken();
              }

              print("login successful");
              print("User Display Name: ${user.displayName}");
              print("User Email: ${user.email}");
              print('ID Token: $idToken');
              print('Access Token: $accessToken');

              // Send the token to backend using Dio
              if (idToken != null) {
                await LoginAPI.sendTokenToBackend(idToken);
              } else {
                print("ID token is null");
              }
            }
          },
          child: Text("login GOOGLE"),
        ),
      ),
    );
  }
}
