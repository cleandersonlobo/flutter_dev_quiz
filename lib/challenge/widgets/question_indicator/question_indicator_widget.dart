import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';
import 'package:flutter_dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão 04", style: AppTextStyles.body15),
              Text("de 10", style: AppTextStyles.body15),
            ],
          ),
          ProgressIndicatorWidget(value: 0.4)
        ],
      ),
    );
  }
}
