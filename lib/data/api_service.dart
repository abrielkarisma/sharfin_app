import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/button.dart';
import 'package:sharfin_app/data/models/surat_detail_model.dart';
import 'package:sharfin_app/data/models/surat_model.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  });

  Future<Either<String, List<Surah>>> getAllSurat() async {
    try {
      final response = await dio.get('https://quran-api-id.vercel.app/surahs/');
      return Right((response.data as List).map((x) => Surah.fromJson(x)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SuratDetail>> getDetailSurat(int nomorSurat) async {
    try {
      final response = await dio.get('https://quran-api-id.vercel.app/surahs/$nomorSurat');
      return Right(SuratDetail.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<List<ButtonApi>> fetchButtons() async {
    try {
      final response = await dio.get('http://192.168.100.73:8888/api/public/icon');
      if (response.statusCode == 200) {
        return (response.data as List).map((data) => ButtonApi.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load buttons: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load buttons: $e');
    }
  }
}
