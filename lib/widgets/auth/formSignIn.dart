// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracklit_flutter/models/signInUser.dart';
import 'package:tracklit_flutter/repositories/authUser/index.dart';
import 'package:tracklit_flutter/routes/index.dart';
import 'package:tracklit_flutter/utils/toasts/index.dart';
import 'package:tracklit_flutter/utils/validators/index.dart';

class FormSignIn extends StatelessWidget {
  FormSignIn({super.key});

  var formData = <String, String>{};
  final formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();

  void signIn(context) async {
    // final isValid = formKey.currentState?.validate() ?? false; 
    // formKey.currentState?.save();

    // final user = TsignInUser(
    //     email: formData["email"] as String,
    //     password: formData["password"] as String);
    // final response = await signInUser(user);
    // if (response.statusCode == 200) {
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setString("token", response.body["token"]);
      Navigator.of(context).pushNamed(AppRouter.home);
    // } else {
    //   showSnackBar(context, response.body["message"]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: "Email", border: OutlineInputBorder()),
            textInputAction: TextInputAction.next,
            obscureText: false,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
            validator: (_email) {
              final email = _email ?? "";
              if(!isValidEmail(email)) return "insira um email válido";
              return null;
            },
            onSaved: (e) => formData["email"] = e ?? "",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: "Password", border: OutlineInputBorder()),
            textInputAction: TextInputAction.done,
            focusNode: _passwordFocus,
            obscureText: false,
            validator: (_password) {
              final password = _password ?? "";
              if(password.trim().length < 8) return "Sua senha precisa ter no mínimo 8 caracteres";
            },
            onSaved: (e) => formData["password"] = e ?? "",
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.05,
          margin: const EdgeInsets.only(top: 40),
          child: ElevatedButton(
            onPressed: () => signIn(context),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Theme.of(context).colorScheme.secondary),
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ]),
    );
  }
}
