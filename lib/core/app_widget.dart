import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/challenge_page.dart';
//import 'package:flutter_dev_quiz/screens/home/home_page.dart';
//import 'package:flutter_dev_quiz/screens/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      home: ChallengePage(),
    );
  }
}
