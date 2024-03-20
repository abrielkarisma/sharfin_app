import 'package:flutter/material.dart';
import 'package:sharfin_app/util/My_button.dart';
import 'package:sharfin_app/view/search_page.dart';

class MenuPage extends StatelessWidget {
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
