import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_routes.dart';
//import 'package:flutter_dev_quiz/screens/challenge/challenge_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
