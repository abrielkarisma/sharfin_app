import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sharfin_app/data/models/Users.dart';
import 'package:sharfin_app/data/service/Users.dart';

import 'package:flutter/gestures.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UsersService _usersService = UsersService();
  Users? user;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final String userId =
          '/1/'; // Assuming this is the correct user ID format
      user = await _usersService.getUsers(userId);
      setState(() {}); // Update UI if using state management
    } catch (error) {
      print(error); // Handle errors appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: user == null
          ? Center(child: CircularProgressIndicator())
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
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(160),
                                child: Image.network(
                                  user!.avatar,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("bisa bang");
                            },
                            child: Container(
                              child: Image(
                                  image: AssetImage("assets/editPhoto.png")),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          user!.name,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff14142B),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
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
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: Image(
                                          image: Svg("assets/profileBlue.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Pengaturan Akun",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
                        padding: EdgeInsets.only(top: 16),
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
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child:
                                          Image(image: Svg("assets/lock.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Ubah Password",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
                        padding: EdgeInsets.only(top: 16),
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
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: Image(
                                          image: Svg("assets/starBlue.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Beri Rating Kami",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
                        padding: EdgeInsets.only(top: 16),
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
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: Image(
                                          image: Svg("assets/notesBlue.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Syarat & Ketentuan",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
                        padding: EdgeInsets.only(top: 16),
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
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: Image(
                                          image: Svg("assets/notesBlue.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Kebijakan Privasi",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
                        padding: EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
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
                                          "Apakah kamu yakin akan keluar aplikasi?",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF14142B),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 8.0),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Container(
                                            child: FilledButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Color(
                                                    0xffFFF2F4)), // Adjust color
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Adjust text color
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical:
                                                        10)), // Adjust padding
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(327, 48)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                side: BorderSide(
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
                                          child: Text("Ya, Logout",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0XFFC0001A),
                                              )),
                                        )),
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 343.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: [
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
                                      padding: EdgeInsets.only(
                                          left: 28,
                                          top: 8,
                                          bottom: 8,
                                          right: 8),
                                      child: Image(
                                          image: Svg("assets/logout.svg")),
                                    ),
                                    Container(
                                      width: 239,
                                      height: 21,
                                      child: Text(
                                        "Logout",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF14142B),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
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
