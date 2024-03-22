import 'package:flutter/material.dart';
import 'package:sharfin_app/util/My_button.dart';

class MenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Keuangan Syariah',
      'items': [
        {'icon': 'assets/paket_data.png', 'text': 'Pulsa & Paket'},
        {'icon': 'assets/Internet.png', 'text': 'Internet'},
        {'icon': 'assets/pln.png', 'text': 'PLN'},
        {'icon': 'assets/pdam.png', 'text': 'PDAM'},
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
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
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
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int panelIndex, bool isExpanded) {
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
                    body: GridView.count(
                      crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
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
                    isExpanded: false, // Set initial expansion state if needed
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
