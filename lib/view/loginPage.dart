import 'package:flutter/material.dart';
import 'package:sharfin_app/data/service/User.dart';
import 'package:sharfin_app/view/registerPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserService _userService = UserService();

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await _userService.login(email, password);

    if (response['success']) {
      final token = response['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const bottomNavigation(selectedIndex: 0);
        }),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 112),
                    child: const Text(
                      "Sharfin.",
                      style: TextStyle(
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
                      padding: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "Masuk dengan akun anda.",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),
                          height: 21 / 17,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 51),
                      child: const Text(
                        "Email",
                        style: TextStyle(
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
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            hintText: 'example@test.com',
                          ),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 27),
                      child: const Text(
                        "Password",
                        style: TextStyle(
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
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            hintText: '••••••••••••••••',
                          ),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 27),
                    child: FilledButton(
                        onPressed: () {
                          _login();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0XFF15AC97)), // Adjust color
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white), // Adjust text color
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10)), // Adjust padding
                          minimumSize: MaterialStateProperty.all(const Size(400, 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  6.0), // Adjust radius as desired
                            ),
                          ),
                        ),
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
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
                      padding: const EdgeInsets.only(top: 27),
                      child: Center(
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Butuh bantuan?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF15AC97),
                                  height: 14 / 12,
                                ),
                                textAlign: TextAlign.center,
                              )))),
                  Container(
                      padding: const EdgeInsets.only(top: 27),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const register();
                          }));
                        },
                        child: const Text(
                          "Belum punya akun? Daftar dulu",
                          style: TextStyle(
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
            )));
  }
}
