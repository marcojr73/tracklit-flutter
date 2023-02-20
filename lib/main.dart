import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:tracklit_flutter/routes/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

void main() async {
  Intl.defaultLocale = "pt_BR";
  await dotenv.load(fileName: ".env");
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
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            background: AppColors.backgroundColor,
            scrim: AppColors.textColor,
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
            tertiary: AppColors.lightColor),
            fontFamily: "Lexend Deca"
      ),
      routes: AppRouter(context).getRoutes()
    );
  }
}
