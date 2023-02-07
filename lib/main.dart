import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tracklit_flutter/pages/authPage.dart';
import 'package:tracklit_flutter/widgets/habits/index.dart';
import 'package:tracklit_flutter/routes/index.dart';
import 'package:tracklit_flutter/states/authBlock.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

void main() async {
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
