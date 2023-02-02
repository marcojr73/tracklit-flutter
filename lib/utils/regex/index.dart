class AppRegex {
  static RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordRegex = RegExp("[0-9a-zA-Z]{8}");
  static RegExp nameRegex = RegExp("[a-zA-Z]{3}");
  static RegExp imageRegex = RegExp(r"(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)");
}