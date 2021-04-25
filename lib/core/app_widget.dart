import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_quiz/core/app_routes.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
