import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<List<dynamic>> getHistoriHabitsApi() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.get(
    Uri.parse("$apiUrl/habits/history/daily"),
    headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    },
  );
  print(response.body);
  return jsonDecode(response.body);
}
