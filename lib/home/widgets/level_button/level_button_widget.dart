import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

const TYPES_LEVEL = ["Fácil", "Médio", "Difícil", "Perito"];

class LebelButtonWidget extends StatelessWidget {
  final String label;

  LebelButtonWidget({
    Key? key,
    required this.label,
  })   : assert(TYPES_LEVEL.contains(label)),
        super(key: key);

  final buttonConfig = {
    "Fácil": AppColors.levelButtonFacilConfig,
    "Médio": AppColors.levelButtonMedioConfig,
    "Difícil": AppColors.levelButtonDificilConfig,
    "Perito": AppColors.levelButtonPeritoConfig,
  };

  Color get color => buttonConfig[label]!["color"]!;
  Color get borderColor => buttonConfig[label]!["boderColor"]!;
  Color get fontColor => buttonConfig[label]!["fontColor"]!;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 80,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: borderColor)),
            borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(label,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                color: fontColor,
                fontSize: 13,
              )),
        ),
      ),
    );
  }
}
