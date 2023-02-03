// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get APIURL => dotenv.get("APIURL");
}