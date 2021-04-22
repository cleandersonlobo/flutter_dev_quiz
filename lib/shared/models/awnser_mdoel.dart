import 'dart:convert';

class AwnserModel {
  final String description;
  final bool isCorrect;

  AwnserModel({
    required this.description,
    this.isCorrect = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'isCorrect': isCorrect,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      description: map['description'],
      isCorrect: map['isCorrect'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));
}
