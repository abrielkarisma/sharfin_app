import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sharfin_app/cubit/button/button_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/data/models/button.dart';
import 'package:sharfin_app/util/My_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(ApiService(dio:Dio()))..fetchButtons(), // Fetch buttons only once
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
                        body: SizedBox(
                          height: 150,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // Set the number of columns to 4
                              crossAxisSpacing: 8.0, // Add spacing between buttons horizontally
                              mainAxisSpacing: 8.0, // Add spacing between buttons vertically
                            ),
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
