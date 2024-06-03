import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharfin_app/data/models/User.dart';
import 'package:sharfin_app/data/service/Google.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final UserService _userService = UserService();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "570248776640-17k0dl1qbu0jelvmff5dlodg2ci197ou.apps.googleusercontent.com",
  );
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

  // Function to handle Google Sign-In
  Future<void> _handleSignIn(BuildContext context) async {
    var googleUser = await LoginAPI.login();
    if (googleUser != null) {
      print("login successful");
      print("User Display Name: ${googleUser.displayName}");
      print("User Email: ${googleUser.email}");
      _emailController.text = googleUser.email;
      var user = User(
        name: googleUser.displayName ?? "",
        email: googleUser.email,
        password: "",
      );
      await login(context, user);
    }
  }

  Future<void> login(BuildContext context, User user) async {
    final email = _emailController.text;
    final password = '';

    final response = await _userService.login(email, password);

    if (response['message'] == 'Unregistered') {
      _showRegistrationModal(context, user);
    } else if (response['message'] == 'Incorrect Password') {
      print("sudah terdaftar");
      try {
        await _userService.registerGoogle(
          user.name,
          user.email,
          password,
          (String? token, String? error) async {
            if (token != null) {
              final data = response['data']['token'];
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', data);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login successful!')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => bottomNavigation(selectedIndex: 0)),
              );
            } else {
              print('Error during registration: $error');
            }
          },
        );
      } catch (error) {
        print('Error registering user: $error');
      }
    } else {
      // Handle other possible responses
      print("Other response: ${response['message']}");
    }
  }

  void _showRegistrationModal(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _passwordInput = TextEditingController();
        TextEditingController _retypePasswordInput = TextEditingController();
        String? errorMessage;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Anda baru di Sharfin',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF15AC97),
                ),
              ),
              content: Container(
                width: 300,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Atur Passwordmu terlebih dahulu untuk menggunakan login manual",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: _passwordInput,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      obscureText: true,
                    ),
                    TextField(
                      controller: _retypePasswordInput,
                      decoration: InputDecoration(
                        hintText: 'Tulis Ulang Password',
                        hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      obscureText: true,
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Poppins",
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: <Widget>[
                FilledButton(
                  onPressed: () async {
                    if (_passwordInput.text != _retypePasswordInput.text) {
                      setState(() {
                        errorMessage = "Password Tidak Sama";
                      });
                    } else {
                      setState(() {
                        errorMessage = null;
                      });
                      try {
                        _userService.registerGoogle(
                            user.name, user.email, _passwordInput.text,
                            (String? token, String? error) async {
                          if (token != null) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('token', token);
                            // Use the main context to navigate
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return const bottomNavigation(selectedIndex: 0);
                              }),
                            );
                          } else {
                            // If an error occurs, display error message
                            setState(() {
                              errorMessage = error ?? "Failed to register user";
                            });
                          }
                        });
                      } catch (error) {
                        setState(() {
                          errorMessage = "Failed to register user";
                        });
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF15AC97)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(120, 42)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFFFFFFFF),
                      height: 18 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
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
          ListView(shrinkWrap: true, children: [
            Container(
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
          ]),
          ListView(children: [
            Container(
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
          ]),
          ListView(children: [
            Container(
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
                          _handleSignIn(context);
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
          ]),
        ],
      ),
    );
  }
}
