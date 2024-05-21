import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sharfin_app/cubit/button/button_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/data/models/Button.dart';
import 'package:sharfin_app/util/My_button.dart';
import 'package:sharfin_app/view/search_page.dart';

<<<<<<< Updated upstream
class MenuPage extends StatelessWidget {
=======
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
<<<<<<< Updated upstream
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Keuangan Syariah',
      'items': [
        {'icon': 'assets/paket_data.png', 'text': 'Pulsa & Paket'},
        {'icon': 'assets/Internet.png', 'text': 'Internet'},
        {'icon': 'assets/pln.png', 'text': 'PLN'},
        {'icon': 'assets/pdam.png', 'text': 'PDAM' },
        {'icon': 'assets/pdam.png', 'text': 'P'},
        {'icon': 'assets/pdam.png', 'text': 'D'},
        {'icon': 'assets/pdam.png', 'text': 'PD'},
        {'icon': 'assets/pdam.png', 'text': 'AM'},
      ],
      // 'isExpanded': false,
    },
    {
      'title': 'Pembelian',
      'items': [
        {'icon': 'assets/paket_data.png', 'text': 'Pulsa & Paket'},
        {'icon': 'assets/Internet.png', 'text': 'Internet'},
        {'icon': 'assets/pln.png', 'text': 'PLN'},
      ],
      // 'isExpanded': false,
    },
    // Add more categories as needed
  ];
=======
  bool _isExpanded = false;
>>>>>>> Stashed changes

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBarDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Keuangan Syariah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                      MyButton(
                        iconImagePath: "assets/Internet.png",
                        buttonText: "Internet",
                      ),
                      MyButton(
                        iconImagePath: "assets/pln.png",
                        buttonText: "PLN",
                      ),
                      MyButton(
                        iconImagePath: "assets/pdam.png",
                        buttonText: "PDAM",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                      MyButton(
                        iconImagePath: "assets/Internet.png",
                        buttonText: "Internet",
                      ),
                      MyButton(
                        iconImagePath: "assets/pln.png",
                        buttonText: "PLN",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Pembelian',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  MyButton(
                    iconImagePath: "assets/paket_data.png",
                    buttonText: "Pulsa & Paket",
                  ),
                  MyButton(
                    iconImagePath: "assets/Internet.png",
                    buttonText: "Internet",
                  ),
                  MyButton(
                    iconImagePath: "assets/pln.png",
                    buttonText: "PLN",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Tagihan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                      MyButton(
                        iconImagePath: "assets/Internet.png",
                        buttonText: "Internet",
                      ),
                      MyButton(
                        iconImagePath: "assets/pln.png",
                        buttonText: "PLN",
                      ),
                      MyButton(
                        iconImagePath: "assets/pdam.png",
                        buttonText: "PDAM",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                      MyButton(
                        iconImagePath: "assets/Internet.png",
                        buttonText: "Internet",
                      ),
                      MyButton(
                        iconImagePath: "assets/pln.png",
                        buttonText: "PLN",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Pajak & Pendidikan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                      MyButton(
                        iconImagePath: "assets/Internet.png",
                        buttonText: "Internet",
                      ),
                      MyButton(
                        iconImagePath: "assets/pln.png",
                        buttonText: "PLN",
                      ),
                      MyButton(
                        iconImagePath: "assets/pdam.png",
                        buttonText: "PDAM",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        iconImagePath: "assets/paket_data.png",
                        buttonText: "Pulsa & Paket",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'BPJS & Asuransi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  MyButton(
                    iconImagePath: "assets/paket_data.png",
                    buttonText: "Pulsa & Paket",
                  ),
                  MyButton(
                    iconImagePath: "assets/Internet.png",
                    buttonText: "Internet",
                  ),
                  MyButton(
                    iconImagePath: "assets/pln.png",
                    buttonText: "PLN",
                  ),
                  MyButton(
                    iconImagePath: "assets/pdam.png",
                    buttonText: "PDAM",
                  ),
                ],
              ),
            ],
          ),
=======
    return BlocProvider(
      create: (context) => ButtonCubit(ApiService(client: http.Client()))
        ..fetchButtons(), // Fetch buttons only once
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Semua Menu',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
            ),
          ],
        ),
        body: BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            if (state is ButtonLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ButtonLoaded) {
              final buttons = state.buttons;
              final Map<String, List<ButtonApi>> categorizedButtons = {};

              // Organize buttons into categories
              for (final button in buttons) {
                if (!categorizedButtons.containsKey(button.category)) {
                  categorizedButtons[button.category] = [];
                }
                categorizedButtons[button.category]!.add(button);
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categorizedButtons.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categorizedButtons.keys.elementAt(index);
                  final categoryButtons = categorizedButtons[category]!;
                  return ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: const EdgeInsets.all(0),
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        body: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Set the number of columns to 4
                            crossAxisSpacing: 8.0, // Add spacing between buttons horizontally
                            mainAxisSpacing: 8.0, // Add spacing between buttons vertically
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryButtons.length,
                          itemBuilder: (context, index) {
                            final button = categoryButtons[index];
                            return MyButton(
                              button: button,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MenuPage(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        isExpanded: _isExpanded, // Set expansion state
                      ),
                    ],
                  );
                },
              );
            } else if (state is ButtonError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No data available'));
            }
          },
>>>>>>> Stashed changes
        ),
      ),
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search Results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Suggestions'),
    );
  }
}
