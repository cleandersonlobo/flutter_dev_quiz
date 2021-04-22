import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("database/quizzes.json");
    final data = jsonDecode(response) as List;
    final quizzes = data.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
