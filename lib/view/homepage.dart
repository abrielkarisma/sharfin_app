import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:sharfin_app/data/models/Ebook.dart";
import "package:sharfin_app/data/models/Insight.dart";
import "package:sharfin_app/data/service/Ebook.dart";
import "package:sharfin_app/data/service/Insight.dart";
import "package:sharfin_app/util/My_button.dart";
import "package:sharfin_app/util/My_card.dart";
import "package:sharfin_app/view/ebooks.dart";
import "package:sharfin_app/view/insight.dart";
import "package:sharfin_app/view/insightDetails.dart";
import "package:sharfin_app/view/islamicFeature.dart";
import "package:sharfin_app/view/semuaMenuPage.dart";
import 'package:flutter_svg/svg.dart';
import "package:sharfin_app/widget/bottomNavigation.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<List<Insight>>? insights = InsightService.getImageInsight();

  final Future<List<Ebook>>? ebooks = EbookService.getImageEbook();

  bool _obsecureText = true;
  final _controller = PageController();

  void toogleVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Assalamualaikum",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            "Ammar",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.notifications_outlined,
                        size: 36,
                        color: Colors.grey[500],
                      ),
                    ],
                  )),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: Color(0xff15ac97),
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage("assets/Circle.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saldo Saya",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Text(
                              "Rp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 120,
                            child: TextFormField(
                              initialValue:
                                  '234567', // Replace with actual balance value
                              obscureText:
                                  _obsecureText, // Toggle visibility based on state
                              readOnly: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight
                                      .w600), // Make the field read-only
                              decoration: InputDecoration(
                                iconColor: Colors.white,
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  onPressed: toogleVisibility,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff887aa6).withOpacity(0.12),
                                blurRadius: 56,
                                spreadRadius: 10,
                                offset: Offset(0.0, 13.0))
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color(0xffb1f1df),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("container pressed");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildColumn(
                                      screenWidth,
                                      Icons.account_balance_wallet_outlined,
                                      "Top up"),
                                  buildColumn(screenWidth,
                                      Icons.swap_horiz_outlined, "Transfer"),
                                  buildColumn(
                                      screenWidth,
                                      Icons.arrow_downward_outlined,
                                      "Tarik Tunai"),
                                  buildColumn(
                                      screenWidth, Icons.history, "Mutasi"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(13),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyButton(
                                iconImagePath: "assets/paket_data.png",
                                buttonText: "Pulsa & Paket",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/Internet.png",
                                buttonText: "Internet",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/pln.png",
                                buttonText: "PLN",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/pdam.png",
                                buttonText: "PDAM",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              MyButton(
                                iconImagePath: "assets/tiket kereta.png",
                                buttonText: "Tiket Kereta",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/e-commerce.png",
                                buttonText: "E-Commerce",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/islami.png",
                                buttonText: "Fitur Islami",
                                pathss: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: IslamPage(),
                                    withNavBar: false,
                                  );
                                },
                              ),
                              MyButton(
                                iconImagePath: "assets/lainnya.png",
                                buttonText: "lainnya",
                                pathss: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                      iconImagePath: "assets/Image.png",
                    ),
                    MyCard(
                      iconImagePath: "assets/Image2.png",
                    ),
                    MyCard(
                      iconImagePath: "assets/Promo.png",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Insight",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  bottomNavigation(selectedIndex: 1),
                            ),
                          );
                        },
                        child: Text(
                          "Lihat Semua",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF15AC97),
                          ),
                        ))
                  ],
                ),
              ),
              FutureBuilder<List<Insight>>(
                future: insights,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Insight> insights = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: screenWidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: insights.length,
                              itemBuilder: (context, index) {
                                final insight = insights[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  detailInsight(
                                                      id: insight.id)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(insight.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 125,
                                      height: 150,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error fetching insights'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reels",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  bottomNavigation(selectedIndex: 1),
                            ),
                          );
                        },
                        child: Text(
                          "Lihat Semua",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF15AC97),
                          ),
                        ))
                  ],
                ),
              ),
              FutureBuilder<List<Insight>>(
                future: insights,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Insight> insights = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: screenWidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: insights.length,
                              itemBuilder: (context, index) {
                                final insight = insights[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  detailInsight(
                                                      id: insight.id)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(insight.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 103,
                                      height: 150,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error fetching insights'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ebook",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  bottomNavigation(selectedIndex: 2),
                            ),
                          );
                        },
                        child: Text(
                          "Lihat Semua",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF15AC97),
                          ),
                        ))
                  ],
                ),
              ),
              FutureBuilder<List<Ebook>>(
                future: ebooks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Ebook> ebooks = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: screenWidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ebooks.length,
                              itemBuilder: (context, index) {
                                final ebook = ebooks[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              detailInsight(id: ebook.id),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(ebook.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 160,
                                      height: 200,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error fetching Ebook'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//test inshigt

class InsightsPage extends StatelessWidget {
  final List<Map<String, dynamic>> insights = [
    {
      'title': 'Insight 1',
      'image': 'https://via.placeholder.com/150',
      'description':
          'Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
    },
    {
      'title': 'Insight 2',
      'image': 'https://via.placeholder.com/150',
      'description':
          'Dart is the programming language used by Flutter for developing applications with a focus on productivity and performance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'All Insights:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (Map<String, dynamic> insight in insights)
              Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(insight['image']),
                  ),
                  title: Text(insight['title']),
                  subtitle: Text(insight['description']),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget buildColumn(double screenWidth, IconData icon, String text) {
  double iconSize = screenWidth > 600 ? 40 : 30;
  double containerHeight = screenWidth > 600 ? 60 : 50;
  double textSize = screenWidth > 600 ? 14 : 12;
  double paddingValue = screenWidth > 600 ? 20 : 10;

  return Column(
    children: [
      Container(
        height: containerHeight,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
        ),
        child: Icon(
          icon,
          color: Color(0xff15ac97),
          size: iconSize,
        ),
      ),
      SizedBox(height: 5),
      Text(
        text,
        style: TextStyle(fontSize: textSize),
      )
    ],
  );
}
