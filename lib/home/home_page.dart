import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: AppColors.light,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TYPES_LEVEL
                    .map((label) => LebelButtonWidget(label: label))
                    .toList(),
              ),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: MOCK_QUIZ_CARDS
                  .map((item) => QuizCardWidget(
                        description: item['description']!,
                        category: item['category']!,
                      ))
                  .toList(),
            )),
          ],
        ),
      ),
    );
  }
}
