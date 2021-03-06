import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/screens/home/home_controller.dart';
import 'package:flutter_dev_quiz/screens/home/home_state.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel? user;
  HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.user = widget.user;
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
      appBar: AppBarWidget(
        user: controller.user,
        onImageTap: () {
          Navigator.of(context).pushReplacementNamed("/login");
        },
      ),
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
                children: MAP_TYPES_LEVEL
                    .map((level) => LebelButtonWidget(
                          label: level['label']!,
                          level: level['key']!,
                          isSelected: level['key']! == controller.level,
                          onPress: () {
                            setState(() {
                              controller.filterQuizzes(level['key']!);
                            });
                          },
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
