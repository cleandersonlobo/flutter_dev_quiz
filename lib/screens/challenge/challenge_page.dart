import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/challenge/challenge_controller.dart';
import 'package:flutter_dev_quiz/screens/challenge/models/control_awnsers_model.dart';
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
  final controller = ChallengeController();
  late ControlAwnsersModel controlAwnsers;
  bool isUnlockScroll = false;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.quiz.questionAwnsered);
    setState(() {
      controller.controlAwnsers = widget.quiz.questions
          .map((e) => ControlAwnsersModel(
              isAwnsered: e.isAwnsered, selected: e.awnsered))
          .toList();
      controller.currentQuestion = widget.quiz.questionAwnsered + 1;
      controlAwnsers = controller.getControlAwnsers();
    });

    controller.controlAwnsersNotfifier.addListener(() {
      setState(() {
        controlAwnsers = controller.getControlAwnsers();
        isUnlockScroll =
            controller.currentQuestion == widget.quiz.questions.length &&
                controlAwnsers.isAwnsered;
      });
    });

    pageController.addListener(() {
      if (pageController.page!.toInt() >= controller.currentQuestion ||
          isUnlockScroll) {
        setState(() {
          controller.currentQuestion = pageController.page!.toInt() + 1;
        });
      }
    });

    controller.currentQuestionNotfifier.addListener(() {
      setState(() {
        controlAwnsers = controller.getControlAwnsers();
      });
    });
  }

  void skipQuestion() {
    if (widget.quiz.questions.length > controller.currentQuestion) {
      setState(() {
        pageController.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel question =
        widget.quiz.questions[controller.currentQuestion - 1];
    bool isLastQuestion =
        controller.currentQuestion == widget.quiz.questions.length;
    bool isAwnsered = controlAwnsers.isAwnsered || question.isAwnsered;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            /// escutar quando deve ser atualizado
            ValueListenableBuilder<int>(
              valueListenable: controller.currentQuestionNotfifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentQuestion: value,
                totalQuestions: widget.quiz.questions.length,
              ),
            ),
          ],
        )),
      ),
      backgroundColor: AppColors.light,
      body: PageView(
        physics: widget.quiz.questionAwnsered < widget.quiz.questions.length &&
                !isUnlockScroll
            ? NeverScrollableScrollPhysics()
            : null,
        controller: pageController,
        children: widget.quiz.questions
            .map((e) => ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    ValueListenableBuilder<int>(
                        valueListenable: controller.currentQuestionNotfifier,
                        builder: (context, value, _) => QuizWidget(
                              question: e,
                              currentQuestion: value,
                              showAwnser: controller
                                  .controlAwnsers[value - 1].isAwnsered,
                              onPressQuestion: controller.toggleAwnser,
                              selected:
                                  controller.controlAwnsers[value - 1].selected,
                            ))
                  ],
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotfifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!isLastQuestion)
                  Expanded(
                    flex: 1,
                    child: ButtonWidget(
                      label: isAwnsered ? "Avançar" : "Pular",
                      variant: isAwnsered ? 'secondary' : 'light',
                      onPress: skipQuestion,
                    ),
                  ),
                if (isLastQuestion && isAwnsered)
                  Expanded(
                    flex: 0,
                    child: SizedBox(width: 8),
                  ),
                if (isLastQuestion && isAwnsered)
                  Expanded(
                    flex: 1,
                    child: ButtonWidget.primary(
                      onPress: () {
                        Navigator.of(context).pushReplacementNamed(
                          "/result",
                          arguments: {
                            "quiz": widget.quiz,
                            "result": controller.result
                          },
                        );
                      },
                      label: "Concluir",
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
