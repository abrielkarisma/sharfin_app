import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Ebook.dart';

class EbookService {
  String _baseUrl = 'http://192.168.100.86:8888/api/public';

  Future<List<Ebook>> fetchEbooks() async {
    try {
      Response response = await Dio().get('$_baseUrl/ebook');
      List<dynamic> data = response.data;
      List<Ebook> ebook = data.map((json) => Ebook.fromJson(json)).toList();
      return ebook;
    } catch (e) {
      print(e);
      throw Exception('Failed to load ebooks: $e');
    }
  }

  Future<Ebook> getEbookByUUID(String uuid) async {
    try {
      Response response = await Dio().get('$_baseUrl/ebook/$uuid');
      return Ebook.fromJson(response.data);
    } catch (error) {
      print(error);
      throw Exception('Failed to load Ebook: $error');
    }
  }
}
