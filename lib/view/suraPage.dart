import 'package:flutter/material.dart';
import 'package:sharfin_app/cubit/surat/surat_cubit.dart';
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
      appBar: AppBar(title: const Text('All Surat')),
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
                final surat = state.listSurat[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AyatPage(surat: surat);
                    }));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor:Colors.transparent , child: Text("${surat.nomor}"),),
                      title: Text('${surat.namaLatin}'),
                      subtitle:
                          Text('${surat.tempatTurun.name}, ${surat.jumlahAyat} Ayat.'),
                    ),
                  ),
                );
              },
              itemCount: state.listSurat.length,
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