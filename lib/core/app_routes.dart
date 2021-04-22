import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/challenge_page.dart';
import 'package:flutter_dev_quiz/screens/home/home_page.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/challenge':
        print(args.toString());
        if (args is QuizModel) {
          return MaterialPageRoute(
            builder: (_) => ChallengePage(
              quiz: args,
            ),
          );
        }

        return _errorRoute();
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
