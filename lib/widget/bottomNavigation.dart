import 'package:flutter/material.dart';
import 'package:sharfin_app/view/ebooks.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/insight.dart';
import 'package:sharfin_app/view/profile.dart';

class bottomNavigation extends StatefulWidget {
  final int selectedIndex;
  const bottomNavigation({super.key, required this.selectedIndex});
  @override
  _bottomNavigationState createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int _bottomNavIndex = 0;
  @override
  void initState() {
    super.initState();
    _bottomNavIndex =
        widget.selectedIndex; // Set the initial index from the parameter
  }

  List<Widget> pages = [
    const HomePage(),
    const InsightPage(),
    const ebooks(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    if (index != 4) {
      setState(() {
        _bottomNavIndex = index;
      });

      print(_bottomNavIndex);
    }
  }

  Widget pageCaller(int index) {
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageCaller(_bottomNavIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 0
                  ? Image.asset(
                      "assets/Home.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "assets/HomeUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 1
                  ? Image.asset(
                      "assets/Star.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "assets/StarUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Insight',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 2
                  ? Image.asset(
                      "assets/Document.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "assets/DocumentUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Ebook',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 3
                  ? Image.asset(
                      "assets/Profile.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "assets/ProfileUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Profil',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _bottomNavIndex,
          selectedItemColor: const Color(0xFF15AC97),
          showSelectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
