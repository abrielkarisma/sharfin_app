import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sharfin_app/view/loginPage.dart';

class profilguest extends StatefulWidget {
  const profilguest({super.key});

  @override
  State<profilguest> createState() => _profilguestState();
}

class _profilguestState extends State<profilguest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 32),
                child: const Image(
                  image: AssetImage("assets/profunlog.png"),
                  width: 125,
                  height: 125,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  "Kamu Belum Terautentikasi",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF14142B),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  "Silahkan masuk atau mendaftar terlebih dahulu",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4E4B66),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color(0xFFFFFFFF),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 500,
                            height: 360,
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Masuk atau Daftar",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF14142B),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  SizedBox(
                                    width: 290,
                                    child: Text.rich(
                                      TextSpan(children: [
                                        const TextSpan(
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
                                          style: const TextStyle(
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
                                        const TextSpan(
                                            text: " yang berlaku dan ",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0XFF4E4B66),
                                            )),
                                        TextSpan(
                                          text: " Kebijakan Privasi",
                                          style: const TextStyle(
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
                                  const SizedBox(
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
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical:
                                                      10)), // Adjust padding
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  const Size(327, 48)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              side: const BorderSide(
                                                color: Color(
                                                    0xFFD9DBE9), // Border color
                                                width: 1.0, // Border width
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: const Row(
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
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Login();
                                          }));
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white), // Adjust color
                                          foregroundColor:
                                              MaterialStateProperty.all(Colors
                                                  .white), // Adjust text color
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical:
                                                      10)), // Adjust padding
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  const Size(343, 48)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  12.0), // Adjust radius as desired
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                  Container(
                                    padding: const EdgeInsets.only(top: 28),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
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
                          const Color(0xFF15AC97)), // Adjust color
                      foregroundColor: MaterialStateProperty.all(
                          Colors.white), // Adjust text color
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10)), // Adjust padding
                      minimumSize:
                          MaterialStateProperty.all(const Size(198, 48)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12.0), // Adjust radius as desired
                        ),
                      ),
                    ),
                    child: const Text(
                      "Masuk atau Daftar",
                      style: TextStyle(
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
      ),
    );
  }
}
