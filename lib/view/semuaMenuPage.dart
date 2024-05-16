import 'package:flutter/material.dart';
import 'package:sharfin_app/util/My_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: const EdgeInsets.all(0),
                expansionCallback: (int panelIndex, bool isExpanded) { isExpanded;
                  // setState(() {
                  // categories[index]['isExpanded'] = !isExpanded;});
                  // Toggle the expansion state of the panel
                  // This is optional if you want to manually control expansion
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          categories[index]['title'],
                          style: TextStyle(
                            fontSize: constraints.maxWidth > 600 ? 24 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ); 
                    },
                    body: GridView.count( // Adjust the spacing between columns as needed
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                    isExpanded:true
                    // categories[index]['isExpanded'], // Set initial expansion state if needed
                  ),
                ],
              );
            },
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
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
    return const Center(
      child: Text('Search Suggestions'),
    );
  }
}
