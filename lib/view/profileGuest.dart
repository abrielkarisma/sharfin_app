import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharfin_app/data/models/User.dart';
import 'package:sharfin_app/data/service/Google.dart';
import 'package:sharfin_app/data/service/User.dart';
import 'package:sharfin_app/view/loginPage.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

class profilguest extends StatefulWidget {
  const profilguest({super.key});

  @override
  State<profilguest> createState() => _profilguestState();
}

class _profilguestState extends State<profilguest> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
    final email = user.email;
    final name = user.name;
    final password = '';

    final response = await _userService.login(email, password);

    if (response['message'] == 'Unregistered') {
      _showRegistrationModal(context, user);
    } else if (response['message'] == 'Incorrect Password') {
      print("sudah terdaftar");
      await _userService.sendEmail(name, email, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const bottomNavigation(selectedIndex: 3);
        }),
      );
    } else {
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

        Future<void> registerButton() async {
          if (_passwordInput.text.length < 8) {
            setState(() {
              errorMessage = "Password harus minimal 8 karakter";
            });
          } else if (_passwordInput.text != _retypePasswordInput.text) {
            setState(() {
              errorMessage = "Password Tidak Sama";
            });
          } else {
            setState(() {
              errorMessage = null;
            });
            try {
              await _userService.registerGoogle(
                  user.name, user.email, _passwordInput.text);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return const bottomNavigation(selectedIndex: 0);
                }),
              );
            } catch (error) {
              setState(() {
                errorMessage = "Failed to register user";
              });
            }
          }
        }

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
                  onPressed: registerButton,
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
                                        onPressed: () {
                                          _handleSignIn(context);
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
