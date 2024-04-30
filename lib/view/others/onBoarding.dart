import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharfin_app/widget/botNav.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15AC97),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            index == 2;
          });
        },
        children: [
          buildPage(1),
          buildPage(2),
          buildPage(3),
        ],
      ),
    );
  }

  Widget buildPage(int pageNumber) {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 68),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: AssetImage("assets/obd$pageNumber.png"),
                    width: 326,
                    height: 440,
                  ),
                  Image(
                    image: AssetImage("assets/Shadow.png"),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              getPageTitle(pageNumber),
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              getPageSubtitle(pageNumber),
              style: TextStyle(
                fontFamily: "Jakarta Sans",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            buildButtons(pageNumber),
            if (pageNumber == 3) buildSkipButton(),
          ],
        ),
      ),
    );
  }

  String getPageTitle(int pageNumber) {
    switch (pageNumber) {
      case 1:
        return "Selamat Datang di Aplikasi Sharfin";
      case 2:
        return "Jelajahi Fitur Unggulan Sharfin";
      case 3:
        return "Bergabung dengan Komunitas Sharfin";
      default:
        return "";
    }
  }

  String getPageSubtitle(int pageNumber) {
    switch (pageNumber) {
      case 1:
        return "Sharfin adalah aplikasi inovatif yang bertujuan untuk mendidik dan memberdayakan masyarakat dalam pengelolaan keuangan syariah.";
      case 2:
        return "Jelajahi beragam fitur unggulan Sharfin yang dirancang untuk membantu Anda memahami dan menerapkan prinsip-prinsip keuangan syariah.";
      case 3:
        return "Mari gabung untuk bertukar ide, berbagi pengalaman, dan belajar dari pengguna lain yang tertarik pada keuangan syariah.";
      default:
        return "";
    }
  }
Widget buildButtons(int pageNumber) {
  if (pageNumber == 1) {
    return FilledButton(
      onPressed: () {
        controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        minimumSize: MaterialStateProperty.all(Size(343, 48)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        "Lanjut",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0XFF15AC97),
          height: 18 / 12,
        ),
        textAlign: TextAlign.left,
      ),
    );
  } else if (pageNumber == 2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
            },
            child: Text(
              "Kembali",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                height: 18 / 12,
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              minimumSize: MaterialStateProperty.all(Size(97, 48)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: Text(
              "Lanjut",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0XFF15AC97),
                height: 18 / 12,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  } else {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        minimumSize: MaterialStateProperty.all(Size(343, 48)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/google.png"),
            width: 24,
            height: 24,
          ),
          SizedBox(width: 12),
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
        ],
      ),
    );
  }
}

  Widget buildSkipButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextButton(
        child: Text(
          "Lewati",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0XFFFFFFFF),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
            return botnav();
          }));
        },
      ),
    );
  }
}
