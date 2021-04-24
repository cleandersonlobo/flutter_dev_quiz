import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/shared/models/result_model.dart';
import './models/control_awnsers_model.dart';

class ChallengeController {
  final currentQuestionNotfifier = ValueNotifier<int>(1);
  final result = ResultModel();
  int get currentQuestion => currentQuestionNotfifier.value;
  set currentQuestion(int value) => currentQuestionNotfifier.value = value;

  final controlAwnsersNotfifier =
      ValueNotifier<List<ControlAwnsersModel>>(List.empty());

  List<ControlAwnsersModel> get controlAwnsers => controlAwnsersNotfifier.value;

  set controlAwnsers(List<ControlAwnsersModel> values) =>
      controlAwnsersNotfifier.value = values;

  ControlAwnsersModel getControlAwnsers() {
    return controlAwnsers.elementAt(currentQuestion - 1);
  }

  void setSelectedAwnsers(int value) {
    controlAwnsers[currentQuestion - 1] = ControlAwnsersModel(
      isAwnsered: true,
      selected: value,
    );
    controlAwnsers = controlAwnsers.toList();
  }

  void toggleAwnser(int index, bool isCorrect) {
    if (isCorrect)
      result.hits++;
    else
      result.errors++;
    setSelectedAwnsers(index);
  }
}
