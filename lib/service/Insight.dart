import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharfin_app/models/Insight.dart';
import 'package:sharfin_app/view/insight.dart';

class InsightService {
  Future<Insight?> getInsight(String url) async {
    try {
      final response = await http.get(
          Uri.parse("https://65fa56d03909a9a65b1a38a0.mockapi.io/Insight/1"));
      if (response.statusCode == 200) {
        print(response.body);
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return Insight.fromJson(json);
      } else {
        throw Exception("Failed to fetch insight: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
