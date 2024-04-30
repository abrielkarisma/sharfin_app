import 'package:flutter/material.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/registerPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 112),
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
                      "Masuk dengan akun anda.",
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
                  height: 100,
                ),
                Container(
                    padding: EdgeInsets.only(top: 51),
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
                          hintText: 'example@test.com',
                        ),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 27),
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
                Container(
                  padding: EdgeInsets.only(top: 27),
                  child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                6.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: Text(
                        "Masuk",
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
                Container(
                    padding: EdgeInsets.only(top: 27),
                    child: Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Butuh bantuan?",
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF15AC97),
                                height: 14 / 12,
                              ),
                              textAlign: TextAlign.center,
                            )))),
                Container(
                    padding: EdgeInsets.only(top: 27),
                    child: Center(
                        child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return register();
                        }));
                      },
                      child: Text(
                        "Belum punya akun? Daftar dulu",
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
            )));
  }
}
