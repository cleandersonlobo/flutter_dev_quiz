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
  List<QuizModel>? quizzes;
  final repository = HomeRepository();
  void getUser() async {
    user = await repository.getUser();
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
