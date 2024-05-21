import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/view/screen/insight.dart';

class InsightService {
  Future<Insight?> getInsight(String id) async {
    try {
<<<<<<< Updated upstream
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
=======
      Response response =
          await Dio().get('http://192.168.136.249:8888/api/public/insight');
      List<dynamic> data = response.data;
      List<Insight> insights =
          data.map((json) => Insight.fromJson(json)).toList();
      return insights;
    } catch (error) {
      throw Exception('Failed to load insights: $error');
>>>>>>> Stashed changes
    }
  }

  static Future<List<Insight>>? getImageInsight() async {
    try {
<<<<<<< Updated upstream
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
=======
      Response response = await Dio().get(
          'http://192.168.136.249:8888/api/public/insight/$uuid'); // Ganti endpoint sesuai dengan endpoint API Anda
      return Insight.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load insight: $error');
>>>>>>> Stashed changes
    }
  }
}
