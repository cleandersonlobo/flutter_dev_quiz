import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/home/home_repository.dart';
import 'package:flutter_dev_quiz/screens/home/home_state.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  String? level;
  List<QuizModel>? quizzes;
  List<QuizModel>? rawQuizzes;
  final repository = HomeRepository();
  getUser() async {
    if (user == null) {
      user = await repository.getUser();
    }
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    await getUser();
    rawQuizzes = quizzes;
    state = HomeState.success;
  }

  void filterQuizzes(String value) {
    if (value == level) {
      level = null;
      quizzes = rawQuizzes;
    } else {
      var list = rawQuizzes
          ?.where((element) => element.level.toString().contains(value))
          .toList();
      if (list != null && list.isNotEmpty) {
        quizzes = list;
      }
      level = value;
    }
  }
}
