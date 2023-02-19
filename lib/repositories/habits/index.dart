// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:tracklit_flutter/models/postHabitModel.dart';
import 'package:tracklit_flutter/models/responseModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<TresponseApi> postHabitApi(TpostHabit habits) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.post(Uri.parse("$apiUrl/habits"),
      headers: {"Content-type": "application/json",
                      "Authorization": "Bearer $token"
            },
      body: jsonEncode({
        "name": habits.name,
        "days": habits.days
      }));
      print(response.body);
      return TresponseApi(statusCode: response.statusCode, body: jsonDecode(response.body));
}