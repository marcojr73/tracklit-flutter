import 'package:tracklit_flutter/utils/regex/index.dart';

bool isValidEmail(String email) {
  if (!AppRegex.emailRegex.hasMatch(email)) return false;
  return true;
}

bool isValidPassword(String password) {
  if (!AppRegex.passwordRegex.hasMatch(password)) return false;
  return true;
}

bool isValidName(String name) {
  if (!AppRegex.nameRegex.hasMatch(name)) return false;
  return true;
}

bool isValidImage(String image) {
  if (image == "") return true;
  if (!AppRegex.imageRegex.hasMatch(image)) return false;
  return true;
}
