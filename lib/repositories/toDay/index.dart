import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getToDayHabitsApi() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.get(Uri.parse("$apiUrl/habits/today"), headers: {
    "Content-type": "application/json",
    "Authorization": "Bearer $token"
  });
  return jsonDecode(response.body);
}

Future<int> postDoneToDayHabitApi(int habitId) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.post(Uri.parse("$apiUrl/habits/$habitId/check"),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      });
  return response.statusCode;
}

Future<int> postNotDoneToDayHabitApi(int habitId) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.post(Uri.parse("$apiUrl/habits/$habitId/uncheck"),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      });
  return response.statusCode;
}