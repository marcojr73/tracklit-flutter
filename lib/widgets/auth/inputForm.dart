import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  var formData = <String, String>{};
  bool Function(String) validate;
  final String type;
  final String labelText;

  InputForm(
      {super.key,
      required this.formData,
      required this.validate,
      required this.type,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelText, border: const OutlineInputBorder()),
        textInputAction: TextInputAction.next,
        obscureText: type == "password" ? true : false,
        validator: (_e) {
          final e = _e ?? "";
          if (!validate(e)) return "insira um treim válido";
          return null;
        },
        onSaved: (e) => formData[type] = e ?? "",
      ),
    );
  }
}
