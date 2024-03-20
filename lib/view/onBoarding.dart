import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharfin_app/view/homePage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 36),
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(4);
              },
              child: Text(
                "SKIP",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff222222),
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 4;
            });
          },
          children: [
            Container(
                child: Column(children: [
              SizedBox(
                height: 68,
              ),
              Image(
                image: AssetImage("assets/slider-bank.png"),
                width: 297,
                height: 297,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Sharfin dapat memberikan rekomendasi produk lembaga keuangan syariah yang sesuai dengan kebutuhan finansial anda",
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
            Container(
                child: Column(children: [
              SizedBox(
                height: 68,
              ),
              Image(
                image: AssetImage("assets/slider-bank (1).png"),
                width: 297,
                height: 297,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Sharfin akan membantu anda dalam penyusunan perencanaan keuangan untuk masa depan anda bersama Finansial Planner tersertifikasi",
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
            Container(
                child: Column(children: [
              SizedBox(
                height: 68,
              ),
              Image(
                image: AssetImage("assets/slider-bank (2).png"),
                width: 297,
                height: 297,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 320,
                child: Text(
                  "Sharfin tidak memberikan pinjaman tanpa agunan secara langsung. Sharfin hanya menghubungkan customer dengan pihak lembaga keuangan syariah",
                  maxLines: 6,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
            Container(
                child: Column(children: [
              SizedBox(
                height: 68,
              ),
              Image(
                image: AssetImage("assets/slider-bank (3).png"),
                width: 297,
                height: 297,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Sharfin menyediakan fitur belajar tentang keuangan syariah dan investasi untuk anda.",
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
            Container(
                child: Column(children: [
              SizedBox(
                height: 68,
              ),
              Image(
                image: AssetImage("assets/slider-bank (4).png"),
                width: 297,
                height: 297,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Ayo, segera gabung bersama Sharfin",
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              padding: EdgeInsets.only(bottom: 24),
              child: FilledButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()
                    ),);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xff15AC97)), // Adjust color
                    foregroundColor: MaterialStateProperty.all(
                        Colors.white), // Adjust text color
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)), // Adjust padding
                    minimumSize: MaterialStateProperty.all(Size(370, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            6.0), // Adjust radius as desired
                      ),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 18 / 12,
                    ),
                    textAlign: TextAlign.left,
                  )),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70),
              height: 230,
              child: Column(children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: WormEffect(
                      activeDotColor: Color(0xff15AC97),
                      spacing: 12,
                      dotColor: Colors.black,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut);
                        },
                        child: Text(
                          'BACK',
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 129,
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut);
                        },
                        child: Text(
                          'NEXT',
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ]),
            ),
    );
  }
}
