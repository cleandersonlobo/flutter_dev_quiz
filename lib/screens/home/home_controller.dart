import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/screens/home/home_state.dart';
import 'package:flutter_dev_quiz/shared/models/awnser_mdoel.dart';
import 'package:flutter_dev_quiz/shared/models/question_model.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
        name: "Cleanderson Lobo",
        photoUrl: "https://avatars.githubusercontent.com/u/1569889");
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title:
              "Flutter gerenciamento de estado Flutter gerenciamento de estado Flutter gerenciamento de estado Flutter gerenciamento de estado",
          questions: [
            QuestionModel(title: "O que o Flutter faz?", awnsers: [
              AwnserModel(
                  description:
                      "Kit de desenvolvimento de interface de usuário"),
              AwnserModel(
                description:
                    "Possibilita a criação de aplicativos compilados nativamente",
                isCorrect: true,
              ),
              AwnserModel(
                  description: "Acho que é uma marca de café do Himalaia"),
              AwnserModel(
                  description:
                      "Possibilita a criação de desktops que são muito incríveis"),
            ])
          ],
          imagem: AppImages.data,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
