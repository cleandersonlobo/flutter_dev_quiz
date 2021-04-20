import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ChartWidget(),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vamos Começar",
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      "Complete os desafios e\navanceem conhecimento",
                      style: AppTextStyles.body,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
