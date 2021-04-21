import 'package:flutter_dev_quiz/shared/models/awnser_mdoel.dart';

class QuestionModel {
  final String title;
  final bool isAnswered;
  final List<AwnserModel> awnsers;

  QuestionModel({
    required this.title,
    required this.awnsers,
    this.isAnswered = false,
  }) : assert(awnsers.length == 4); // para garantir o tamanho do layout
}
