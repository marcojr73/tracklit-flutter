import 'package:flutter/material.dart';
import 'package:tracklit_flutter/routes/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tracklit",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              background: AppColors.backgroundColor,
              primary: AppColors.primaryColor,
              secondary: AppColors.secondaryColor,
              tertiary: AppColors.lightColor),
        ),
        routes: AppRouter(context).getRoutes()
      );
  }
}
