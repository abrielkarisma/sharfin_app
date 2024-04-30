import 'package:flutter/material.dart';
import 'package:sharfin_app/util/My_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<bool> _isExpandedList; // List to track expansion state

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Keuangan Syariah',
      'items': [
        {'icon': 'assets/paket_data.png', 'text': 'Pulsa & Paket'},
        {'icon': 'assets/Internet.png', 'text': 'Internet'},
        {'icon': 'assets/pln.png', 'text': 'PLN'},
        {'icon': 'assets/pdam.png', 'text': 'PDAM'},
        {'icon': 'assets/pdam.png', 'text': 'P'},
        {'icon': 'assets/pdam.png', 'text': 'D'},
        {'icon': 'assets/pdam.png', 'text': 'PD'},
        {'icon': 'assets/pdam.png', 'text': 'AM'},
      ],
    },
    {
      'title': 'Pembelian',
      'items': [
        {'icon': 'assets/paket_data.png', 'text': 'Pulsa & Paket'},
        {'icon': 'assets/Internet.png', 'text': 'Internet'},
        {'icon': 'assets/pln.png', 'text': 'PLN'},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _isExpandedList =
        List.generate(categories.length, (index) => false); // Initialize all panels as collapsed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semua Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(0),
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                _isExpandedList[panelIndex] = !isExpanded; // Toggle expansion
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      categories[index]['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                body: SizedBox(
                  height: 200,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 12),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      categories[index]['items'].length,
                      (itemIndex) {
                        var item = categories[index]['items'][itemIndex];
                        return MyButton(
                          iconImagePath: item['icon'],
                          buttonText: item['text'],
                          pathss: () {
                            print('pressed');
                            // Handle navigation here based on item
                            // For example:
                            // if (item['text'] == 'Pulsa & Paket') {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => PulsaPaketPage(),
                            //     ),
                            //   );
                            // }
                          },
                        );
                      },
                    ),
                  ),
                ),
                isExpanded: _isExpandedList[index], // Set expansion state
              ),
            ],
          );
        },
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
    // Build the search results based on the query
    return Center(
      child: Text('Search Results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build suggestions that appear when typing in the search bar
    return Center(
      child: Text('Search Suggestions'),
    );
  }
}
