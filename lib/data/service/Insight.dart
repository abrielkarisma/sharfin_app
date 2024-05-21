import 'package:dio/dio.dart';
import 'package:sharfin_app/data/models/Insight.dart';

class InsightService {
  static final String _baseUrl = 'http://192.168.100.72:8888/api/public';

  static Future<List<Insight>> getImageInsights() async {
    try {
      Response response = await Dio().get('$_baseUrl/insight');
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
      Response response = await Dio().get('$_baseUrl/insight/$uuid');
      return Insight.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load insight: $error');
    }
  }
}
