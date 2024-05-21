import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/data/service/Ebook.dart';
import 'package:sharfin_app/data/service/Insight.dart';
import 'package:sharfin_app/util/My_button.dart';
import 'package:sharfin_app/util/My_card.dart';
import 'package:sharfin_app/view/detailInsight.dart';
import 'package:sharfin_app/view/ebookDetails.dart';
import 'package:sharfin_app/view/islamicFeature.dart';
import 'package:sharfin_app/view/semuaMenuPage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<List<Insight>>? insights = InsightService.getImageInsights();
  String? _token;
  String? _name; // Variable to store the decoded name
  // final Future<List<Ebook>>? ebooks = EbookService.getImageEbook();

  bool _obsecureText = true;
  final _controller = PageController();

  void toggleVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

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
    });
    if (_name != null) {
      print(
          'Username: $_name '); // Print inside setState to ensure it's updated
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
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
                            _name ??
                                "", // Display the name or an empty string if null
                            style: const TextStyle(
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
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: const Color(0xff15ac97),
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          image: AssetImage("assets/Circle.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
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
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Text(
                              "Rp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              initialValue:
                                  '234567', // Replace with actual balance value
                              obscureText:
                                  _obsecureText, // Toggle visibility based on state
                              readOnly: true,
                              style: const TextStyle(
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
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xff887aa6).withOpacity(0.12),
                                blurRadius: 56,
                                spreadRadius: 10,
                                offset: const Offset(0.0, 13.0))
                          ],
                          gradient: const LinearGradient(
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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(13),
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
                                      builder: (context) => const MenuPage(),
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
                                      builder: (context) => const MenuPage(),
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
                                      builder: (context) => const MenuPage(),
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
                                      builder: (context) => const MenuPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                      builder: (context) => const MenuPage(),
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
                                      builder: (context) => const MenuPage(),
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
                                    screen: const IslamPage(),
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
                                      builder: (context) => const MenuPage(),
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
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: const [
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Insight",
                      style: TextStyle(
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
                                  const bottomNavigation(selectedIndex: 1),
                            ),
                          );
                        },
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
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
                          SizedBox(
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
                                                  DetailInsight(
                                                      uuid: insight.uuid)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: NetworkImage("insight.img"),
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
                    return const Center(child: Text('Error fetching insights'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Reels",
                      style: TextStyle(
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
                                  const bottomNavigation(selectedIndex: 1),
                            ),
                          );
                        },
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
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
                          SizedBox(
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
                                                  DetailInsight(
                                                      uuid: insight.uuid)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: NetworkImage("insight.img"),
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
                    return const Center(child: Text('Error fetching insights'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ebook",
                      style: TextStyle(
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
                                  const bottomNavigation(selectedIndex: 2),
                            ),
                          );
                        },
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF15AC97),
                          ),
                        ))
                  ],
                ),
              ),
              // FutureBuilder<List<Ebook>>(
              //   future: ebooks,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final List<Ebook> ebooks = snapshot.data!;
              //       return SingleChildScrollView(
              //         child: Column(
              //           children: [
              //             SizedBox(
              //               height: 200,
              //               width: screenWidth,
              //               child: ListView.builder(
              //                 scrollDirection: Axis.horizontal,
              //                 itemCount: ebooks.length,
              //                 itemBuilder: (context, index) {
              //                   final ebook = ebooks[index];
              //                   return Padding(
              //                     padding: const EdgeInsets.symmetric(
              //                         horizontal: 8.0),
              //                     child: GestureDetector(
              //                       onTap: () {
              //                         // Navigator.push(
              //                         //   context,
              //                         //   MaterialPageRoute(
              //                         //     builder: (context) =>
              //                         //         detailEbook(id: ebook.id),
              //                         //   ),
              //                         // );
              //                       },
              //                       child: Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(10),
              //                           image: DecorationImage(
              //                             image: NetworkImage("ebook.image"),
              //                             fit: BoxFit.cover,
              //                           ),
              //                         ),
              //                         width: 160,
              //                         height: 200,
              //                       ),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     } else if (snapshot.hasError) {
              //       return const Center(child: Text('Error fetching Ebook'));
              //     }
              //     return const Center(child: CircularProgressIndicator());
              //   },
              // ),
              const SizedBox(
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

  InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'All Insights:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (Map<String, dynamic> insight in insights)
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
        ),
        child: Icon(
          icon,
          color: const Color(0xff15ac97),
          size: iconSize,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        text,
        style: TextStyle(fontSize: textSize),
      )
    ],
  );
}
