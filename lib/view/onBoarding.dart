import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';
import 'package:dio/dio.dart';
import 'package:sharfin_app/data/service/User.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        final auth = await account.authentication;
        final idToken = auth.idToken;
        print(idToken);

        // Kirim idToken ke server backend Anda
        final response = await Dio().post(
          'http://192.168.100.73/auth/google_mobile_callback',
          data: {'id_token': idToken},
        );

        if (response.statusCode == 200) {
          print('Login berhasil');
        } else {
          print('Login gagal');
        }
      }
    } catch (error) {
      print(error);
    }
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 68,
                    ),
                    child: const Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
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
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 68,
                    ),
                    child: const Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
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
                    child: const Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
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
                        onPressed: () {
                          _handleSignIn();
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
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
          ),
        ],
      ),
    );
  }
}
