import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class ButtonLinkWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String variant;
  const ButtonLinkWidget(
      {Key? key, required this.text, this.onPressed, this.variant = 'dark'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppColors.black.withOpacity(0.1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: variant == 'dark'
              ? AppTextStyles.body15Bold
              : AppTextStyles.body15White,
        ));
  }
}
