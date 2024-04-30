import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/view/screen/ebooks.dart';

class EbookService {
  Future<Ebook?> getEbook(String id) async {
    try {
      var response = await Dio()
          .get("https://65fa56d03909a9a65b1a38a0.mockapi.io/Ebook/$id");

      if (response.statusCode == 200) {
        return Ebook(
            id: response.data['id'],
            title: response.data['title'],
            about: response.data['about'],
            content: response.data['content'],
            image: response.data['image']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Ebook>>? getImageEbook() async {
    try {
      var response =
          await Dio().get("https://65fa56d03909a9a65b1a38a0.mockapi.io/Ebook");
      if (response.statusCode == 200) {
        final List<Ebook> ebook = (response.data as List)
            .map((json) => Ebook.fromJson(json))
            .toList();
        return ebook;
      } else {
        throw Exception('Failed to fetch images: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching images: ${e.toString()}');
    }
  }
}
