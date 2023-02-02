import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/authPage.dart';
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
        child: BlocBuilder<ToggleBloc, bool>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                state ? FormSignIn() : FormSignUp(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<ToggleBloc>(context).add(Toggle());
                    },
                    child: Text(toSignUp))
              ],
            );
          },
        ),
      ),
    );
  }
}
