import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final onPress;
  final String label;
  final String variant;
  ButtonWidget({
    Key? key,
    required this.label,
    required this.onPress,
    required this.variant,
  })   : assert(['primary', "secondary", "light"].contains(variant)),
        super(key: key);

  final buttonConfig = {
    "primary": {
      "text": AppColors.white,
      "button": AppColors.primary,
    },
    "secondary": {
      "text": AppColors.white,
      "button": AppColors.primary,
    },
    "light": {
      "text": AppColors.lightGrey,
      "button": AppColors.white,
    },
  };

  Color get buttonColor => buttonConfig[variant]!['button']!;
  Color get fontColor => buttonConfig[variant]!['text']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 164),
      child: Ink(
        decoration: BoxDecoration(
            color: buttonColor,
            border: variant != 'light'
                ? null
                : Border.fromBorderSide(
                    BorderSide(color: AppColors.border, width: 1)),
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    color: fontColor,
                    fontSize: 13,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
