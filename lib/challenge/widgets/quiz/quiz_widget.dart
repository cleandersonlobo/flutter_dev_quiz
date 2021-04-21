import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  final List<Map<String, Object>> questions;
  final onPressQuestion;
  var indexSelected;
  final bool showAwnser;
  QuizWidget({
    Key? key,
    required this.showAwnser,
    required this.title,
    required this.questions,
    required this.onPressQuestion,
    required this.indexSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AwnserWidget(
                    selected: indexSelected == index,
                    onPress: () {
                      onPressQuestion(index);
                    },
                    showAwnser: showAwnser,
                    isCorrect: (questions[index]['isCorrect']! as bool),
                    text: (questions[index]['description']! as String),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
