import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sharfin_app/data/models/surat_detail_model.dart';
import 'package:sharfin_app/data/models/surat_model.dart';

class ApiService {
  final http.Client client;
  ApiService({
    required this.client,
  });
  Future<Either<String, List<Surah>>> getAllSurat() async {
  try {
    final response = 
      await client.get(Uri.parse('https://quran-api-id.vercel.app/surahs/'));
    return Right(List<Surah>.from(
      jsonDecode(response.body).map(
        (x)=> Surah.fromJson(x),
        ),
        ).toList());
  }catch (e) {
    return Left(e.toString());
  }}

  Future<Either<String, SuratDetail >> getDetailSurat(
    int nomorSurat) async {
  try {
    final response = 
      await client.get(Uri.parse('https://quran-api-id.vercel.app/surahs/$nomorSurat'));
    return Right(SuratDetail.fromJson(jsonDecode(response.body)));
  }catch (e) {
    return Left(e.toString());
  }
}
  }

