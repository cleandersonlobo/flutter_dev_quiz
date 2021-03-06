import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1))
        .then((_) => Navigator.of(context).pushReplacementNamed("/login"));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
