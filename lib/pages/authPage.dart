import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/authBlock.dart';
import 'package:tracklit_flutter/widgets/auth/formSignIn.dart';
import 'package:tracklit_flutter/widgets/auth/formSignUp.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  final String toSignIn = "Já tem uma conta? faça o login!";
  final String toSignUp = "Não tem uma conta? cadastre-se";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TogglePage, bool>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  state ? FormSignIn() : FormSignUp(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<TogglePage>(context).add(AuthInitial());
                      },
                      child: Text(toSignUp))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
