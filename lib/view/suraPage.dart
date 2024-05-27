import 'package:flutter/material.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/view/ayatPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  @override
  void initState() {
    context.read<SuratCubit>().getAllSurat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SuratCubit, SuratState>(
        builder: (context, state) {
          if (state is SuratLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuratLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final surat = state.listSurah[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AyatPage(surat: surat);
                    }));
                  },
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Stack(
                        children: [
                          SvgPicture.asset('assets/border_nomer.svg'),
                          SizedBox(
                            height: 32,
                            width: 32,
                            child: Center(
                              child: Text(
                                "${surat.number}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa0a3bd)),
                              ),
                            ),
                          )
                        ],
                      ),
                      title: Text(
                        surat.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${surat.revelation} . ${surat.numberOfAyahs} Ayat.',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffa0a3bd)),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.listSurah.length,
            );
          }

          if (state is SuratError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('no data'),
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
