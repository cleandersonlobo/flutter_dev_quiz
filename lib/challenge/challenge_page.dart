import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:flutter_dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/shared/widgets/button/button_widget.dart';

const MOCK_QUIZ_QUESTION = ([
  {
    "description": "Kit de desenvolvimento de interface de usuário",
    "isCorrect": false,
  },
  {
    "description":
        "Possibilita a criação de aplicativos compilados nativamente",
    "isCorrect": true,
  },
  {
    "description": "Acho que é uma marca de café do Himalaia",
    "isCorrect": false,
  },
  {
    "description": "Possibilita a criação de desktops que são muito incríveis",
    "isCorrect": false,
  },
]);

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  bool showAwnser = false;

  var indexSelected;

  void toggleAwnser(int index) {
    if (!showAwnser) {
      setState(() {
        indexSelected = index == indexSelected ? null : index;
      });
    }
  }

  void confirmAwnser() {
    if (indexSelected >= 0) {
      setState(() {
        showAwnser = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(child: QuestionIndicatorWidget()),
        ),
        backgroundColor: AppColors.light,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  QuizWidget(
                    title: "O que o Flutter faz em sua totalidade?",
                    questions: MOCK_QUIZ_QUESTION,
                    showAwnser: showAwnser,
                    onPressQuestion: toggleAwnser,
                    indexSelected: indexSelected,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ButtonWidget(
                          label: "Pular",
                          variant: "light",
                          onPress: () {},
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonWidget(
                          label: "Confirmar",
                          variant: "primary",
                          onPress: confirmAwnser,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
