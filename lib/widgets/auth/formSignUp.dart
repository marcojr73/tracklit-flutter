// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tracklit_flutter/models/signUpUser.dart';
import 'package:tracklit_flutter/repositories/authUser/index.dart';
import 'package:tracklit_flutter/states/authBlock.dart';
import 'package:tracklit_flutter/utils/toasts/index.dart';
import 'package:tracklit_flutter/utils/validators/index.dart';
import 'package:tracklit_flutter/widgets/auth/inputForm.dart';

class FormSignUp extends StatelessWidget {
  FormSignUp({super.key});

  var formData = <String, String>{};
  final formKey = GlobalKey<FormState>();

  void signUp(context) async {
    formKey.currentState?.validate() ?? false;
    formKey.currentState?.save();

    final user = TsignUpUser(
        email: formData["email"] as String,
        password: formData["password"] as String,
        name: formData["name"] as String,
        image: formData["image"] as String);
    final response = await signUpUser(user);
    if (response == 200) {
      BlocProvider.of<ToggleBloc>(context).add(Toggle());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        InputForm(
            formData: formData,
            validate: isValidEmail,
            labelText: "Email",
            type: "email"),
        InputForm(
            formData: formData,
            validate: isValidPassword,
            labelText: "Senha",
            type: "password"),
        InputForm(
            formData: formData,
            validate: isValidName,
            labelText: "Nome",
            type: "name"),
        InputForm(
            formData: formData,
            validate: isValidImage,
            labelText: "Imagem (opcional)",
            type: "image"),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.05,
          margin: const EdgeInsets.only(top: 40),
          child: BlocBuilder<ToggleBloc, bool>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () => signUp(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.secondary),
                ),
                child: const Text(
                  'Log-in',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
