import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';

class profilguest extends StatefulWidget {
  const profilguest({super.key});

  @override
  State<profilguest> createState() => _profilguestState();
}

class _profilguestState extends State<profilguest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          "Profil",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Image(
                image: AssetImage("assets/profunlog.png"),
                width: 125,
                height: 125,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Kamu Belum Terautentikasi",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF14142B),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Silahkan masuk atau mendaftar terlebih dahulu",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4E4B66),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: FilledButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Color(0xFFFFFFFF),
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: 500,
                          height: 360,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "Masuk atau Daftar",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFF14142B),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                SizedBox(
                                  width: 290,
                                  child: Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Dengan mendaftar saya menyetujui ",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0XFF4E4B66),
                                          )),
                                      TextSpan(
                                        text: "Syarat & Ketentuan",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF15AC97),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print(
                                                "Syarat & Ketentuan pressed!");
                                          },
                                      ),
                                      TextSpan(
                                          text: " yang berlaku dan ",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0XFF4E4B66),
                                          )),
                                      TextSpan(
                                        text: " Kebijakan Privasi",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF15AC97),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print("Joss");
                                          },
                                      ),
                                    ]),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  child: FilledButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white), // Adjust color
                                        foregroundColor:
                                            MaterialStateProperty.all(Colors
                                                .white), // Adjust text color
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical:
                                                    10)), // Adjust padding
                                        minimumSize: MaterialStateProperty.all(
                                            Size(327, 48)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            side: BorderSide(
                                              color: Color(
                                                  0xFFD9DBE9), // Border color
                                              width: 1.0, // Border width
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  "assets/google.png"),
                                              width: 24,
                                              height: 24,
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              "Lanjutkan Dengan Google",
                                              style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0XFF14142B),
                                                height: 18 / 12,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ])),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 28),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Batal",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFFA0A3BD),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xFF15AC97)), // Adjust color
                    foregroundColor: MaterialStateProperty.all(
                        Colors.white), // Adjust text color
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)), // Adjust padding
                    minimumSize: MaterialStateProperty.all(Size(198, 48)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Adjust radius as desired
                      ),
                    ),
                  ),
                  child: Text(
                    "Masuk atau Daftar",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFFFFFFFF),
                      height: 18 / 12,
                    ),
                    textAlign: TextAlign.left,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
