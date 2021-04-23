import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/screens/home/home_controller.dart';
import 'package:flutter_dev_quiz/screens/home/home_state.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.success) {
      return Scaffold(
        backgroundColor: AppColors.light,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(user: controller.user),
      backgroundColor: AppColors.light,
      body: Container(
        color: AppColors.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TYPES_LEVEL
                    .map((label) => LebelButtonWidget(
                          label: label,
                          onPress: () {},
                        ))
                    .toList(),
              ),
            ),
            controller.quizzes != null
                ? Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: controller.quizzes!
                            .map((item) => QuizCardWidget(
                                  quiz: item,
                                ))
                            .toList()),
                  )
                : CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
          ],
        ),
      ),
    );
  }
}
