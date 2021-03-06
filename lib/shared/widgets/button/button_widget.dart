import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final String variant;
  final double maxWidth;
  final bool animation;
  final bool isLoading;
  ButtonWidget({
    Key? key,
    required this.label,
    required this.onPress,
    required this.variant,
    this.maxWidth = 164,
    this.isLoading = false,
    this.animation = false,
  })  : assert(['primary', "secondary", "light", "dark"].contains(variant)),
        super(key: key);

  ButtonWidget.primary(
      {required VoidCallback onPress,
      required String label,
      double maxWidth = 164})
      : this.variant = 'primary',
        this.onPress = onPress,
        this.label = label,
        this.isLoading = false,
        this.animation = false,
        this.maxWidth = maxWidth;

  ButtonWidget.light(
      {required VoidCallback onPress,
      required String label,
      double maxWidth = 164})
      : this.variant = 'light',
        this.onPress = onPress,
        this.label = label,
        this.isLoading = false,
        this.animation = false,
        this.maxWidth = maxWidth;

  ButtonWidget.secondary({
    required VoidCallback onPress,
    required String label,
    double maxWidth = 164,
  })  : this.variant = 'secondary',
        this.onPress = onPress,
        this.label = label,
        this.animation = false,
        this.isLoading = false,
        this.maxWidth = maxWidth;

  final buttonConfig = {
    "primary": {
      "text": AppColors.white,
      "button": AppColors.primary,
    },
    "secondary": {
      "text": AppColors.white,
      "button": AppColors.purple,
    },
    "light": {
      "text": AppColors.lightGrey,
      "button": AppColors.white,
    },
    "dark": {
      "text": AppColors.white,
      "button": AppColors.black,
    }
  };

  Color get buttonColor => buttonConfig[variant]!['button']!;
  Color get fontColor => buttonConfig[variant]!['text']!;

  _buttonWidget() {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: maxWidth),
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

  Widget _isLoadingWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(buttonColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!animation) {
      return Material(
        type: MaterialType.transparency,
        child: _buttonWidget(),
      );
    }
    return Material(
      type: MaterialType.transparency,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(child: child, opacity: animation);
        },
        key: ValueKey<bool>(isLoading),
        child: isLoading ? _isLoadingWidget() : _buttonWidget(),
      ),
    );
  }
}
