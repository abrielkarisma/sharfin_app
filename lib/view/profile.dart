import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sharfin_app/data/models/Users.dart';
import 'package:sharfin_app/data/service/Users.dart';

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
