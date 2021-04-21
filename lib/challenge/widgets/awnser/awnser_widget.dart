import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class AwnserWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final bool isCorrect;
  final bool showAwnser;
  final onPress;
  AwnserWidget({
    Key? key,
    required this.text,
    required this.selected,
    required this.isCorrect,
    required this.showAwnser,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: selected ? AppColors.lightGreen : AppColors.white,
        border: Border.fromBorderSide(BorderSide(
          color: selected ? AppColors.green : AppColors.border,
        )),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    text,
                    style: selected
                        ? AppTextStyles.bodyDarkGreen
                        : AppTextStyles.body,
                  )),
              SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: showAwnser && isCorrect
                          ? AppColors.darkGreen
                          : AppColors.white,
                      border: Border.all(
                          width: showAwnser && isCorrect ? 1 : 0,
                          color: AppColors.border)),
                  child: showAwnser && isCorrect
                      ? Center(
                          child: Icon(
                          Icons.check,
                          size: 15.0,
                          color: Colors.white,
                        ))
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
