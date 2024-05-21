import 'package:flutter/material.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';
import 'package:dio/dio.dart';
import 'package:sharfin_app/data/service/User.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: const Color(0xFF15AC97),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            index == 2;
          });
        },
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 68,
                  ),
                  child:
                      const Stack(alignment: Alignment.bottomCenter, children: [
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
                  child: const Text(
                    "Selamat Datang di Aplikasi Sharfin",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: const Text(
                    "Sharfin adalah aplikasi inovatif yang bertujuan untuk mendidik dan memberdayakan masyarakat dalam pengelolaan keuangan syariah.",
                    style: TextStyle(
                      fontFamily: "Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: FilledButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust color
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust text color
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10)), // Adjust padding
                        minimumSize:
                            MaterialStateProperty.all(const Size(343, 48)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: const Text(
                        "Lanjut",
                        style: TextStyle(
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 68,
                  ),
                  child:
                      const Stack(alignment: Alignment.bottomCenter, children: [
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
                  child: const Text(
                    "Jelajahi Fitur Unggulan Sharfin",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: const SizedBox(
                    width: 370,
                    child: Text(
                      "Jelajahi beragam fitur unggulan Sharfin yang dirancang untuk membantu Anda memahami dan menerapkan prinsip-prinsip keuangan syariah.",
                      style: TextStyle(
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
                    padding: const EdgeInsets.only(top: 24),
                    child: TextButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: const Text(
                          "Kembali",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            height: 18 / 12,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 151,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    child: FilledButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white), // Adjust color
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white), // Adjust text color
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10)), // Adjust padding
                          minimumSize:
                              MaterialStateProperty.all(const Size(97, 48)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Adjust radius as desired
                            ),
                          ),
                        ),
                        child: const Text(
                          "Lanjut",
                          style: TextStyle(
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 8)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const bottomNavigation(
                        selectedIndex: 0,
                      );
                    }));
                  },
                  child: const SizedBox(
                    width: 320,
                    child: Text(
                      "Lewati",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFFFFFFF),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child:
                      const Stack(alignment: Alignment.bottomCenter, children: [
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
                  child: const Text(
                    "Bergabung dengan Komunitas Sharfin",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: const Text(
                    "Mari gabung untuk bertukar ide, berbagi pengalaman, dan belajar dari pengguna lain yang tertarik pada keuangan syariah.",
                    style: TextStyle(
                      fontFamily: "Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust color
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust text color
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10)), // Adjust padding
                        minimumSize:
                            MaterialStateProperty.all(const Size(343, 48)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: const Row(
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
                              style: TextStyle(
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
                  padding: const EdgeInsets.only(top: 8),
                  child: FilledButton(
                      onPressed: () {
                        googleLogin();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust color
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Adjust text color
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10)), // Adjust padding
                        minimumSize:
                            MaterialStateProperty.all(const Size(343, 48)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust radius as desired
                          ),
                        ),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Masuk Dengan Akun Anda",
                              style: TextStyle(
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> googleLogin() async {
    try {
      var dio = Dio();
      var response = await dio.get('http:192.168.100.86/google_login');

      if (response.statusCode == 200) {
        // Handle success response, e.g., navigate to the returned URL
        var googleAuthUrl = response.data['url'];
        // Use a package like url_launcher to open the URL in a web browser
        await launch(googleAuthUrl);
      } else {
        // Handle error response
        print('Failed to login with Google: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error during Google login: $e');
    }
  }
}
