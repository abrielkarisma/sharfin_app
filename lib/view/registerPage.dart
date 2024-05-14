import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/data/models/User.dart';
import 'package:sharfin_app/data/service/User.dart';
import 'package:sharfin_app/data/service/Users.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'dart:convert';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool _showPassword = false;
  final UserService _userService = UserService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reTypePasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  void _register() {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String reTypePassword = _reTypePasswordController.text.trim();

    // Validasi email menggunakan regular expression
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Cek apakah semua field terisi
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        reTypePassword.isNotEmpty) {
      // Validasi email
      if (!emailRegExp.hasMatch(email)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter a valid email address.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Stop the registration process
      }

      // Validasi password
      if (password != reTypePassword) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Password and Confirm Password must match.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Stop the registration process
      }

      // Semua validasi terpenuhi, lakukan registrasi
      final User user = User(name: name, email: email, password: password);
      _userService.registerUser(user).then((_) {
        // Navigasi ke halaman homepage setelah berhasil mendaftar
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => bottomNavigation(
                    selectedIndex: 0,
                  )),
        );
      });
    } else {
      // Tampilkan pesan error jika ada field yang kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 54),
              child: Text(
                "Sharfin.",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF15AC97),
                  height: 54 / 36,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Daftarkan akunmu disini.",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 21 / 17,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Nama Lengkap",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 18 / 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
                padding: EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 55.0,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      hintText: 'contoh: John Doe',
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Email",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 18 / 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
                padding: EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 55.0,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      hintText: 'contoh: example@test.com',
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Password",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 18 / 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 55.0,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    hintText: '••••••••••••••••',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: !_showPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty"; // Customize error message
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    }
                    return null; // Password is valid
                  },
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Re-type Password",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 18 / 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 55.0,
                child: TextFormField(
                  controller: _reTypePasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    hintText: '••••••••••••••••',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: !_showPassword,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return "Password tidak sama";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: FilledButton(
                  onPressed: () {
                    _register();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0XFF15AC97)), // Adjust color
                    foregroundColor: MaterialStateProperty.all(
                        Colors.white), // Adjust text color
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)), // Adjust padding
                    minimumSize: MaterialStateProperty.all(Size(400, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            6.0), // Adjust radius as desired
                      ),
                    ),
                  ),
                  child: Text(
                    "Daftar",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 18 / 12,
                    ),
                    textAlign: TextAlign.left,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 36 / 24,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Dengan mendaftar, kamu telah menyetujui ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Syarat & Ketentuan ",
                          style: const TextStyle(color: Color(0XFF15AC97)),
                        ),
                        TextSpan(
                          text: "Serta ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Kebijakan Privasi ",
                          style: const TextStyle(color: Color(0XFF15AC97)),
                        ),
                        TextSpan(
                          text: "Refoodbish ",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ])),
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                  child: Text(
                    "Sudah punya akun? Masuk aja",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 14 / 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))),
          ],
        ),
      ),
    ));
  }
}
