// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracklit_flutter/models/responseModel.dart';
import 'package:tracklit_flutter/models/signInUser.dart';
import 'package:tracklit_flutter/models/signUpUser.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<TresponseApi> signUpUser(TsignUpUser user) async {
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.post(Uri.parse("$apiUrl/auth/sign-up"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "email": user.email,
        "name": user.name,
        "image": user.image,
        "password": user.password
      }));
      print(response.body);
      return TresponseApi(statusCode: response.statusCode, body: jsonDecode(response.body));
}

Future<TresponseApi> signInUser(TsignInUser user) async {
  final apiUrl = dotenv.env["APIURL"];
  final response = await http.post(Uri.parse("$apiUrl/auth/login"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "email": user.email,
        "password": user.password
      }));
      print(response.body);
      return TresponseApi(statusCode: response.statusCode, body: jsonDecode(response.body));
}