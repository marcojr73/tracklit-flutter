// class AppRouter {
//   static const auth = "/";
//   static const home = "/home";
//   static const habits = "/home/habits";
//   static const historic = "/home/historic";
//   static const today = "/home/today";
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/pages/HomePage.dart';
import 'package:tracklit_flutter/widgets/habits/index.dart';
import 'package:tracklit_flutter/states/authBlock.dart';
import 'package:tracklit_flutter/pages/authPage.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';

class AppRouter {
  BuildContext context;
  AppRouter(this.context);

  static const signUp = "/";
  static const home = "/home";

  Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routesToReturn = {};

    List routes = [
      {
        "path": signUp,
        "page": BlocProvider(
          create: (context) => TogglePage(),
          child: const AuthPage(),
        ),
      },
      {
        "path": home,
        "page": const HomePage(),
      },
    ];

    for (var route in routes) {
      routesToReturn[route["path"] as String] =
          (BuildContext context) => route["page"] as Widget;
    }

    return routesToReturn;
  }
}
