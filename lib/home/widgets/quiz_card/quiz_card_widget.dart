import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

const MOCK_QUIZ_CARDS = ([
  {
    "description": 'Gerenciamento de Estado',
    "category": "data",
  },
  {"description": "Construindo Interfaces", "category": "laptop"},
  {"description": "Integração Nativa", "category": "hierarchy"},
  {"description": "Widgets do Flutter", "category": "blocks"},
]);

class QuizCardWidget extends StatelessWidget {
  final String description;
  final String category;
  QuizCardWidget({
    Key? key,
    required this.description,
    required this.category,
  }) : super(key: key);

  String get image => AppImages.getImage(category);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 160,
      maxHeight: 177,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.border),
            )),
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
                description,
                style: AppTextStyles.heading15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "3 de 10",
                        style: AppTextStyles.body11,
                      )),
                  Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(value: 0.3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
