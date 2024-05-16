import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/data/models/surat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AyatPage extends StatefulWidget {
  const AyatPage({
    super.key,
    required this.surat,
  });
  final Surah surat;

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    //context.read<AyatCubit>().getDetailSurat(widget.surat.number);
    context.read<AyatBloc>().add(AyatGetEvent(noSurat: widget.surat.number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.surat.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        centerTitle: true,
      ),
      body: BlocBuilder<AyatBloc, AyatState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyatLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayat = state.detail.ayahs[index];
                return Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset('assets/border_nomer.svg'),
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: Center(
                                  child: Text(
                                    "${ayat.number.inSurah}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffa0a3bd)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                              child: Text(
                            ayat.arab,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/border_nomer.svg',
                                color: Colors.transparent,
                              ),
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: Center(
                                  child: Text(
                                    "${ayat.number.inSurah}.",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                            child: Text(
                          '${ayat.translation} ',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.clip,
                        )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.detail.ayahs.length,
            );
          }
          if (state is AyatError) {
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
