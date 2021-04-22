import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/widgets/awnser/awnser_widget.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';
import 'package:flutter_dev_quiz/shared/models/awnser_mdoel.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  final List<AwnserModel> awnsers;
  final onPressQuestion;
  final indexSelected;
  final bool showAwnser;
  QuizWidget({
    Key? key,
    required this.showAwnser,
    required this.title,
    required this.awnsers,
    required this.onPressQuestion,
    this.indexSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
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
              itemCount: awnsers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AwnserWidget(
                    selected: indexSelected == index,
                    onPress: () {
                      onPressQuestion(index);
                    },
                    showAwnser: showAwnser,
                    isCorrect: awnsers[index].isCorrect,
                    text: awnsers[index].description,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
