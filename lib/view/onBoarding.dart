import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/profilguest.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/widget/botNav.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15AC97),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            index == 2;
          });
        },
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 68,
                  ),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image(
                      image: AssetImage("assets/obd1.png"),
                      width: 326,
                      height: 440,
                    ),
                    Image(
                      image: AssetImage("assets/Shadow.png"),
                    )
                  ]),
                ),
                Container(
                  child: Text(
                    "Selamat Datang di Aplikasi Sharfin",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Sharfin adalah aplikasi inovatif yang bertujuan untuk mendidik dan memberdayakan masyarakat dalam pengelolaan keuangan syariah.",
                    style: const TextStyle(
                      fontFamily: "Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: FilledButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust color
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust text color
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)), // Adjust padding
                        minimumSize: MaterialStateProperty.all(Size(343, 48)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: Text(
                        "Lanjut",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF15AC97),
                          height: 18 / 12,
                        ),
                        textAlign: TextAlign.left,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 68,
                  ),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image(
                      image: AssetImage("assets/obd2.png"),
                      width: 326,
                      height: 440,
                    ),
                    Image(
                      image: AssetImage("assets/Shadow.png"),
                    )
                  ]),
                ),
                Container(
                  child: Text(
                    "Jelajahi Fitur Unggulan Sharfin",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: 370,
                    child: Text(
                      "Jelajahi beragam fitur unggulan Sharfin yang dirancang untuk membantu Anda memahami dan menerapkan prinsip-prinsip keuangan syariah.",
                      style: const TextStyle(
                        fontFamily: "Jakarta Sans",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    padding: EdgeInsets.only(top: 24),
                    child: TextButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Text(
                          "Kembali",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            height: 18 / 12,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 151,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24),
                    child: FilledButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white), // Adjust color
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white), // Adjust text color
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10)), // Adjust padding
                          minimumSize: MaterialStateProperty.all(Size(97, 48)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Adjust radius as desired
                            ),
                          ),
                        ),
                        child: Text(
                          "Lanjut",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0XFF15AC97),
                            height: 18 / 12,
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 68,
                  ),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image(
                      image: AssetImage("assets/obd3.png"),
                      width: 326,
                      height: 440,
                    ),
                    Image(
                      image: AssetImage("assets/Shadow.png"),
                    )
                  ]),
                ),
                Container(
                  child: Text(
                    "Bergabung dengan Komunitas Sharfin",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Mari gabung untuk bertukar ide, berbagi pengalaman, dan belajar dari pengguna lain yang tertarik pada keuangan syariah.",
                    style: const TextStyle(
                      fontFamily: "Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust color
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust text color
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)), // Adjust padding
                        minimumSize: MaterialStateProperty.all(Size(343, 48)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/google.png"),
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
                  padding: EdgeInsets.only(top: 20),
                  child: TextButton(
                    child: Text(
                      "Lewati",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return botnav();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
