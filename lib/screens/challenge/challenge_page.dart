import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:flutter_dev_quiz/screens/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/shared/models/question_model.dart';
import 'package:flutter_dev_quiz/shared/models/quiz_modal.dart';
import 'package:flutter_dev_quiz/shared/widgets/button/button_widget.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  // ignore: deprecated_member_use
  var showAwnser = List.empty();
  int currentQuestion = 1;
  var indexSelected;
  @override
  void initState() {
    super.initState();
    setState(() {
      showAwnser = widget.quiz.questions.map((e) => e.isAnswered).toList();
      currentQuestion = widget.quiz.questionAwnsered + 1;
    });
  }

  void toggleAwnser(int index) {
    if (!showAwnser.elementAt(currentQuestion - 1)) {
      setState(() {
        indexSelected = index == indexSelected ? 0 : index;
      });
    }
  }

  void confirmAwnser() {
    if (indexSelected >= 0) {
      setState(() {
        showAwnser[currentQuestion - 1] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void skipQuestion() {
      if (widget.quiz.questions.length > currentQuestion) {
        setState(() {
          indexSelected = null;
          currentQuestion = currentQuestion + 1;
        });
      }
    }

    QuestionModel question = widget.quiz.questions[currentQuestion - 1];
    bool currentShowAwnser = showAwnser.elementAt(currentQuestion - 1);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
              child: QuestionIndicatorWidget(
            currentQuestion: currentQuestion,
            totalQuestions: widget.quiz.questions.length,
          )),
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
                    question: question,
                    currentQuestion: currentQuestion,
                    showAwnser: currentShowAwnser,
                    onPressQuestion: toggleAwnser,
                    indexSelected: indexSelected,
                  )
                ],
              ),
            ),
            Container(
              color: AppColors.light,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ButtonWidget(
                        label: "Pular",
                        variant: "light",
                        onPress: skipQuestion,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        width:
                            !question.isAnswered && !currentShowAwnser ? 8 : 0,
                      ),
                    ),
                    !question.isAnswered && !currentShowAwnser
                        ? Expanded(
                            flex: 1,
                            child: ButtonWidget(
                              label: "Confirmar",
                              variant: "primary",
                              onPress: confirmAwnser,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
