// ignore_for_file: avoid_print

import 'package:tracklit_flutter/models/signInUser.dart';
import 'package:tracklit_flutter/models/signUpUser.dart';
import 'package:tracklit_flutter/utils/config/index.dart';

Future signUpUser(TsignUpUser user) async {
  try {
    print("aaaaaaaaaaaa");
    final apiUrl = Config.APIURL;
    print(apiUrl);
    print(user.email);
  } catch (e) {
    print(e);
    return e;
  }
}