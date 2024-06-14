import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharfin_app/cubit/button/button_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/data/models/button.dart';
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
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Insight>> _insightsFuture;
  late Future<List<Ebook>> futureEbooks;
  final InsightService _insightService = InsightService();
  final EbookService _EbookService = EbookService();
  String? _token;
  String? _name;

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
    _insightsFuture = InsightService.getImageInsights();
    futureEbooks = EbookService().fetchEbooks();
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
      print('Username: $_name ');
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
                            _name ?? "Guest",
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
                                  fontWeight: FontWeight.w600),
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
                                  onPressed: toggleVisibility,
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
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              print("container pressed");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 250.0, // Provide a finite height
                child: BlocProvider(
                  create: (context) =>
                      ButtonCubit(ApiService(dio: Dio()))..fetchButtons(),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: BlocBuilder<ButtonCubit, ButtonState>(
                      builder: (context, state) {
                        if (state is ButtonLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is ButtonLoaded) {
                          final apibuttons = state.buttons.take(6).toList();

                          // Define the two new icons
                          final newIcons = [
                            ButtonApi(
                              uuid: 'new-uuid-1',
                              name: 'Fitur Islami',
                              category: 'New',
                              iconFile: 'assets/islami.png',
                              isLocal: true,
                            ),
                            ButtonApi(
                              uuid: 'new-uuid-2',
                              name: 'Lainnya',
                              category: 'New',
                              iconFile: 'assets/lainnya.png',
                              isLocal: true,
                            ),
                          ];

                          // Combine the API buttons with the new icons
                          final allButtons = [...apibuttons, ...newIcons];

                          // Limit the item count to 8 (2 rows * 4 columns)
                          final displayButtons = allButtons.take(8).toList();

                          return SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: displayButtons.length,
                              itemBuilder: (context, index) {
                                final button = displayButtons[index];
                                return MyButton(
                                  button: button,
                                  onPressed: () {
                                    if (index >= apibuttons.length) {
                                      if (index - apibuttons.length == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IslamPage()));
                                      } else if (index - apibuttons.length ==
                                          1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MenuPage(),
                                          ),
                                        );
                                      }
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MenuPage(),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          );
                        } else if (state is ButtonError) {
                          return Center(child: Text('Error: ${state.message}'));
                        } else {
                          return Center(child: Text('No data available'));
                        }
                      },
                    ),
                  ),
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
                      iconImagePath: "assets/Image.png",
                    ),
                    MyCard(
                      iconImagePath: "assets/Image.png",
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
                future: _insightsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display shimmer effect while loading
                    return SizedBox(
                      height: 150,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3, // Display shimmer for 3 items
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 125,
                                height: 150,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<Insight> insights = snapshot.data ?? [];
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
                                Insight insight = insights[index];
                                String imageUrl =
                                    "https://api.rumaloka.id${insight.img.first}";

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailInsight(uuid: insight.uuid),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(imageUrl),
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
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const bottomNavigation(selectedIndex: 1),
                          //   ),
                          // );
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
              Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 50,
                      color: Color(0xFF15AC97),
                    ),
                    Text(
                      "Segera Hadir",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
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
              FutureBuilder<List<Ebook>>(
                future: futureEbooks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Ebook> ebooks = snapshot.data ?? [];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: screenWidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ebooks.length,
                              itemBuilder: (context, index) {
                                Ebook ebook = ebooks[index];
                                String imageUrl =
                                    "https://api.rumaloka.id${ebook.thumbnail}";

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => detailEbook(
                                                  uuid: ebook.uuid)));
                                    },
                                    child: Container(
                                      width: 125,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  width: 125,
                                                  height: 150,
                                                  color: Colors.white,
                                                ),
                                              );
                                            }
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Center(
                                                child: Icon(Icons.error,
                                                    color: Colors.red));
                                          },
                                        ),
                                      ),
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
  double iconSize = screenWidth > 600 ? 35 : 25;
  double containerHeight = screenWidth > 600 ? 55 : 45;
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
