// class AppRouter {
//   static const auth = "/";
//   static const home = "/home";
//   static const habits = "/home/habits";
//   static const historic = "/home/historic";
//   static const today = "/home/today";
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/authPage.dart';
import 'package:tracklit_flutter/pages/authPage.dart';

class AppRouter {
  BuildContext context;
  AppRouter(this.context);

  Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routesToReturn = {};

    List routes = [
      {
        "path": "/",
        "page": BlocProvider(
          create: (context) => ToggleBloc(),
          child: const AuthPage(),
        ),
      },
    ];

    for (var route in routes) {
      routesToReturn[route["path"] as String] =
          (BuildContext context) => route["page"] as Widget;
    }

    return routesToReturn;
  }
}
