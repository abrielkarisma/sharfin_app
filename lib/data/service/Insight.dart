import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Insight.dart';
import 'package:sharfin_app/view/insight.dart';

class InsightService {
  static Future<List<Insight>> getImageInsights() async {
    try {
      Response response =
          await Dio().get('http://192.168.1.14:8888/api/public/insight');
      List<dynamic> data = response.data;
      List<Insight> insights =
          data.map((json) => Insight.fromJson(json)).toList();
      return insights;
    } catch (error) {
      throw Exception('Failed to load insights: $error');
    }
  }

  static Future<Insight> getInsightByUUID(String uuid) async {
    try {
      Response response = await Dio().get(
          'http://192.168.1.14:8888/api/public/insight/$uuid'); // Ganti endpoint sesuai dengan endpoint API Anda
      return Insight.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load insight: $error');
    }
  }
}
