import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  QuizCardWidget({Key? key, required this.quiz}) : super(key: key);

  String get image => AppImages.getImage(quiz.imagem);

  @override
  Widget build(BuildContext context) {
    int questionAwnsered = quiz.questionAwnsered;
    int total = quiz.questions.length;
    void onNavigateToChallenge() {
      Navigator.of(context).pushNamed(
        '/challenge',
        arguments: quiz,
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: BoxConstraints(maxWidth: 160, maxHeight: 177),
      child: Ink(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.border),
            )),
        child: InkWell(
          onTap: onNavigateToChallenge,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(image),
                ),
                Text(
                  quiz.title,
                  maxLines: 3,
                  style: AppTextStyles.heading15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "$questionAwnsered de $total",
                          style: AppTextStyles.body11,
                        )),
                    Expanded(
                      flex: 2,
                      child: ProgressIndicatorWidget(
                          value: questionAwnsered / quiz.questions.length),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
