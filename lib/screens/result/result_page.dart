import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_images.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/models/result_model.dart';
import 'package:flutter_dev_quiz/shared/widgets/button/button_widget.dart';
import 'package:flutter_dev_quiz/shared/widgets/button_link/button_link_widget.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;
  final ResultModel result;
  const ResultPage({
    Key? key,
    required this.quiz,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Scrollbar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(AppImages.trophy)],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Parabéns!", style: AppTextStyles.titleDark),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Você concluiu", style: AppTextStyles.body15),
                  SizedBox(
                    height: 6,
                  ),
                  Text(quiz.title, style: AppTextStyles.body15Bold),
                  SizedBox(
                    height: 6,
                  ),
                  Text("com ${result.hits} de ${quiz.questions.length} acertos",
                      style: AppTextStyles.body15),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonWidget.secondary(
                      maxWidth: 240, label: "Compartilhar", onPress: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonLinkWidget(
                    text: "Voltar ao inicio",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
