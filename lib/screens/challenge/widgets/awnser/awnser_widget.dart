import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_text_styles.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class AwnserWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final bool isCorrect;
  final bool showAwnser;
  final bool showCorrectAwnser;
  final onPress;
  AwnserWidget({
    Key? key,
    required this.text,
    required this.selected,
    required this.isCorrect,
    required this.showAwnser,
    required this.onPress,
    this.showCorrectAwnser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getColorAwnser() {
      if (selected && !showAwnser || (selected && showAwnser && isCorrect)) {
        return {
          "textStyle": AppTextStyles.bodyDarkGreen,
          "container": AppColors.lightGreen,
          "boder": AppColors.green,
          "icon": showAwnser && isCorrect
              ? Center(
                  child: Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                ))
              : Container(),
          "iconColor":
              showAwnser && isCorrect ? AppColors.darkGreen : AppColors.white
        };
      }

      if (selected && showAwnser && !isCorrect) {
        return {
          "textStyle": AppTextStyles.bodyDarkRed,
          "container": AppColors.lightRed,
          "boder": AppColors.red,
          "iconColor": AppColors.darkRed,
          "icon": Center(
              child: Icon(
            Icons.close,
            size: 15.0,
            color: Colors.white,
          ))
        };
      }

      return {
        "textStyle": AppTextStyles.body,
        "container": AppColors.white,
        "boder": AppColors.border,
        "iconColor": AppColors.white,
        "icon": Container()
      };
    }

    return Ink(
      decoration: BoxDecoration(
        color: getColorAwnser()['container'] as Color,
        border: Border.fromBorderSide(BorderSide(
          color: getColorAwnser()['boder'] as Color,
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
                    style: getColorAwnser()['textStyle'] as TextStyle,
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
                      color: getColorAwnser()['iconColor'] as Color,
                      border: Border.all(
                          width: showAwnser && isCorrect ? 1 : 0,
                          color: AppColors.border)),
                  child: getColorAwnser()['icon'] as Widget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
