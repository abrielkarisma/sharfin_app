import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharfin_app/data/models/Users.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/others/kebijakanprivasi.dart';
import 'package:sharfin_app/view/others/syaratketentuan.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Users? user;
  String? _token;
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _getTokenFromSharedPreferences();
  }

  Future<void> _getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      setState(() {
        _token = token;
        _decodeToken(token);
      });
    }
  }

  void _decodeToken(String token) {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    setState(() {
      _name = decodedToken['name'];
      _email = decodedToken['email'];
    });
    if (_name != null) {
      print(
          'Username: $_name '); //  Print inside setState to ensure it's updated
      print('Email: $_email '); // Print inside setState to ensure it's updated
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const onboarding()),
      (Route<dynamic> route) => false, // Menghapus semua rute sebelumnya
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(160),
                                child: Image(
                                  image: Svg("assets/profilePict.svg"),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: const Image(
                                  image: AssetImage("assets/editPhoto.png")),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          _name ?? "Guest",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff14142B),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            print("bisa");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/profileBlue.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Pengaturan Akun",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            print("bisa");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/lock.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Ubah Password",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            print("bisa");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/starBlue.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Beri Rating Kami",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const syaratketentuan();
                            }));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/notesBlue.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Syarat & Ketentuan",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const kebijakanprivasi();
                            }));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/notesBlue.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Kebijakan Privasi",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
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
                                          "Apakah kamu yakin akan keluar aplikasi?",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF14142B),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8.0),
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        Container(
                                            child: FilledButton(
                                          onPressed: () {
                                            _logout();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty
                                                .all(const Color(
                                                    0xffFFF2F4)), // Adjust color
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
                                                  color: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255), // Border color
                                                  width: 1.0, // Border width
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: const Text("Ya, Logout",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0XFFC0001A),
                                              )),
                                        )),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 28),
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1F887AA6),
                                      offset: Offset(0, 13),
                                      blurRadius: 56,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: const Image(
                                          image: Svg("assets/logout.svg")),
                                    ),
                                    const SizedBox(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 24,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
