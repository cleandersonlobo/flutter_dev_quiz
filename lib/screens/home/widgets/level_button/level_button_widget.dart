import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

const TYPES_LEVEL = ["Fácil", "Médio", "Difícil", "Perito"];

const MAP_TYPES_LEVEL = [
  {"label": "Fácil", "key": 'facil'},
  {"label": "Médio", "key": 'medio'},
  {"label": "Difícil", "key": 'dificil'},
  {"label": "Perito", "key": 'perito'},
];

// ignore: must_be_immutable
class LebelButtonWidget extends StatelessWidget {
  final String label;
  final String level;
  final bool isSelected;
  final onPress;
  LebelButtonWidget({
    Key? key,
    required this.label,
    required this.level,
    this.isSelected = false,
    this.onPress,
  })  : assert(TYPES_LEVEL.contains(label)),
        super(key: key);

  var buttonConfig = {
    "Fácil": AppColors.levelButtonFacilConfig,
    "Médio": AppColors.levelButtonMedioConfig,
    "Difícil": AppColors.levelButtonDificilConfig,
    "Perito": AppColors.levelButtonPeritoConfig,
  };

  Color get color => buttonConfig[label]!["color"]!;
  Color get borderColor => buttonConfig[label]!["boderColor"]!;
  Color get fontColor => buttonConfig[label]!["fontColor"]!;
  final BorderRadius borderRadius = BorderRadius.circular(28);
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 80),
        child: Ink(
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.getLevelNotSelectConfig(level)['color']
                  : color,
              border: Border.fromBorderSide(BorderSide(
                  color: isSelected
                      ? AppColors.getLevelNotSelectConfig(level)['boderColor']
                          as Color
                      : borderColor)),
              borderRadius: borderRadius),
          child: InkWell(
            onTap: onPress,
            borderRadius: borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? AppColors.getLevelNotSelectConfig(level)['fontColor']
                        : fontColor,
                    fontSize: 13,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
