import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sharfin_app/data/models/Button.dart';
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

<<<<<<< Updated upstream
  Future<Either<String, List<ButtonApi>>> getAllButtons() async {
  try {
    final response = 
      await client.get(Uri.parse('http://192.168.1.14:8888/api/public/icon'));
    return Right(List<ButtonApi>.from(
      jsonDecode(response.body).map(
        (x)=> Surah.fromJson(x),
        ),
        ).toList());
  }catch (e) {
    return Left(e.toString());
  }}
=======

 Future<List<ButtonApi>> fetchButtons() async {
  try {
    final response = await client.get(Uri.parse('http://192.168.136.249:8888/api/public/icon'));
    if (response.statusCode == 200) {
      // Parse the response body
      final List<dynamic> jsonData = json.decode(response.body);
      
      // Map JSON data to ButtonApi objects
      List<ButtonApi> buttons = jsonData.map((data) => ButtonApi.fromJson(data)).toList();

      return buttons;
    } else {
      // Handle non-200 status code
      throw Exception('Failed to load buttons: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions during the request
    throw Exception('Failed to load buttons: $e');
  }
}

>>>>>>> Stashed changes
  }

