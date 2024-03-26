import 'package:dio/dio.dart';
import 'package:sharfin_app/models/Insight.dart';
import 'package:sharfin_app/view/insight.dart';

class InsightService {
  Future<Insight?> getInsight(String id) async {
    try {
      var response = await Dio()
          .get("https://65fa56d03909a9a65b1a38a0.mockapi.io/Insight/$id");

      if (response.statusCode == 200) {
        return Insight(
            id: response.data['id'],
            title: response.data['title'],
            description: response.data['description'],
            image: response.data['image']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Insight>>? getImageInsight() async {
    try {
      var response = await Dio()
          .get("https://65fa56d03909a9a65b1a38a0.mockapi.io/Insight");
      if (response.statusCode == 200) {
        final List<Insight> insights = (response.data as List)
            .map((json) => Insight.fromJson(json))
            .toList();
        return insights;
      } else {
        throw Exception('Failed to fetch images: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching images: ${e.toString()}');
    }
  }
}
