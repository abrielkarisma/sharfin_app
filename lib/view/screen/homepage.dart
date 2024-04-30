// ignore_for_file: prefer_const_constructors
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:sharfin_app/util/My_button.dart";
import "package:sharfin_app/util/My_card.dart";
import "package:sharfin_app/view/screen/islamicFeature.dart";
import "package:sharfin_app/view/others/semuaMenuPage.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> insights = [
    {
      'image': "assets/examInsight.png",
    },
    {
      'image': "assets/examInsight.png",
    },
    {
      'image': "assets/examInsight.png",
    },
  ];

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
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff887aa6).withOpacity(0.12),
                              blurRadius: 56,
                              spreadRadius: 10,
                              offset: Offset(0.0, 13.0),
                            ),
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
                                  buildColumn2(
                                      screenWidth,
                                      Icons.account_balance_wallet_outlined,
                                      "Top up"),
                                  buildColumn2(screenWidth,
                                      Icons.swap_horiz_outlined, "Transfer"),
                                  buildColumn2(
                                      screenWidth,
                                      Icons.arrow_downward_outlined,
                                      "Tarik Tunai"),
                                  buildColumn2(
                                      screenWidth, Icons.history, "Mutasi"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
              SizedBox(height: 25),
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Insights:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (Map<String, dynamic> insight in insights)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Handle insight tap
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 125,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(insight['image']),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Reels:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (Map<String, dynamic> insight in insights)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Handle insight tap
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 103,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(insight['image']),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Ebook:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (Map<String, dynamic> insight in insights)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Handle insight tap
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 160,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(insight['image']),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
    );
  }
}

//test inshigt

Widget buildColumn2(double screenWidth, IconData iconData, String text) {
  double paddingValue = screenWidth > 600 ? 15 : 10;

  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(paddingValue),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white),
              ),
              child: Icon(
                iconData,
                color: Color(0xff15ac97),
              )),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(color: Color(0xff4e4b66), fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}

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
