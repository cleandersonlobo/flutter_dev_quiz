import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/widgets/awnser/awnser_widget.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';
import 'package:flutter_dev_quiz/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  final int currentQuestion;
  final onPressQuestion;
  final indexSelected;
  final bool showAwnser;
  QuizWidget({
    Key? key,
    required this.showAwnser,
    required this.onPressQuestion,
    required this.question,
    required this.currentQuestion,
    this.indexSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isAnswered = question.isAnswered || showAwnser;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              question.title,
              textAlign: TextAlign.left,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: question.awnsers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AwnserWidget(
                    selected: indexSelected == index,
                    onPress: () {
                      onPressQuestion(index);
                    },
                    showAwnser: isAnswered,
                    isCorrect: question.awnsers[index].isCorrect,
                    text: question.awnsers[index].description,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
