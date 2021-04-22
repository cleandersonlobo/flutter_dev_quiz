import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isAnswered': isAnswered,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      isAnswered: map['isAnswered'] ?? false,
      awnsers: List<AwnserModel>.from(
          map['awnsers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
