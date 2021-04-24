import 'dart:convert';

import 'package:flutter_dev_quiz/shared/models/awnser_mdoel.dart';

class QuestionModel {
  final String title;
  final bool isAwnsered;
  final List<AwnserModel> awnsers;
  final awnsered;

  QuestionModel({
    required this.title,
    required this.awnsers,
    this.isAwnsered = false,
    this.awnsered,
  }) : assert(awnsers.length == 4); // para garantir o tamanho do layout

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isAwnsered': isAwnsered,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
      'awnsered': awnsered,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      isAwnsered: map['isAwnsered'] ?? false,
      awnsers: List<AwnserModel>.from(
          map['awnsers']?.map((x) => AwnserModel.fromMap(x))),
      awnsered: map['awnsered'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
