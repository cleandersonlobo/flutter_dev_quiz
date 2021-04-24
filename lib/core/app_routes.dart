import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/challenge_page.dart';
import 'package:flutter_dev_quiz/screens/home/home_page.dart';
import 'package:flutter_dev_quiz/screens/result/result_page.dart';
import 'package:flutter_dev_quiz/screens/splash/splash_page.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/challenge':
        final quiz = settings.arguments;
        if (quiz is QuizModel) {
          return MaterialPageRoute(
            builder: (_) => ChallengePage(
              quiz: quiz,
            ),
          );
        }
        return _errorRoute();
      case '/result':
        final quiz = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ResultPage(quiz: quiz as QuizModel));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
