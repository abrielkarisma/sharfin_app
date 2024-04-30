import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
            height: 120,
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
                child: TextField(
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
                child: TextField(
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
              padding: EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 55.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    hintText: '••••••••••••••••',
                  ),
                ),
              )),
          SizedBox(
            height: 60,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: FilledButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return bottomNavigation(selectedIndex: 0);
                  }));
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
    ));
  }
}
