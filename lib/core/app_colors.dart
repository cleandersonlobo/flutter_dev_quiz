import 'package:flutter/material.dart';

class AppColors {
  static final Color purple = Color(0xFF8257E5);
  static final Color white = Color(0xFFFFFFFF);
  static final Color black = Color(0xFF514766);
  static final Color grey = Color(0xFF6E6680);
  static final Color lightGrey = Color(0xFFA6A1B2);
  static final Color light = Color(0xFFF5F5FA);
  static final Color border = Color(0xFFE1E1E6);
  static final Color chartSecondary = Color(0xFFE1E6E3);
  static final Color chartPrimary = darkGreen;

  //Greens
  static final Color lightGreen = Color(0xFFE1F5EC);
  static final Color green = Color(0xFFB8DBCB);
  static final Color darkGreen = Color(0xFF03AB4F);

  //Reds
  static final Color lightRed = Color(0xFFF5E9EC);
  static final Color red = Color(0xFFE5C5CF);
  static final Color darkRed = Color(0xFFCC3750);

  //LevelButton
  static final Color levelButtonFacil = Color(0xFFEBEBFC);
  static final Color levelButtonMedio = lightGreen;
  static final Color levelButtonDificil = Color(0xFFF5EFE9);
  static final Color levelButtonPerito = lightRed;

  static final Color levelButtonBorderFacil = Color(0xFFCECEF5);
  static final Color levelButtonBorderMedio = green;
  static final Color levelButtonBorderDificil = Color(0xFFE5D5C5);
  static final Color levelButtonBorderPerito = red;

  static final Color levelButtonTextFacil = Color(0xFF6363DB);
  static final Color levelButtonTextMedio = darkGreen;
  static final Color levelButtonTextDificil = Color(0xFFE8891C);
  static final Color levelButtonTextPerito = darkRed;

  static final levelButtonFacilConfig = {
    "color": AppColors.levelButtonFacil,
    "boderColor": AppColors.levelButtonBorderFacil,
    "fontColor": AppColors.levelButtonTextFacil
  };

  static final levelButtonMedioConfig = {
    "color": AppColors.levelButtonMedio,
    "boderColor": AppColors.levelButtonBorderMedio,
    "fontColor": AppColors.levelButtonTextMedio
  };

  static final levelButtonDificilConfig = {
    "color": AppColors.levelButtonDificil,
    "boderColor": AppColors.levelButtonBorderDificil,
    "fontColor": AppColors.levelButtonTextDificil
  };

  static final levelButtonPeritoConfig = {
    "color": AppColors.levelButtonPerito,
    "boderColor": AppColors.levelButtonBorderPerito,
    "fontColor": AppColors.levelButtonTextPerito
  };

  static final levelButtonSelectedConfig = {
    "color": AppColors.white,
    "boderColor": AppColors.lightGrey,
    "fontColor": AppColors.black
  };

  static Map<String, dynamic> getLevelNotSelectConfig(String key) {
    var config = levelButtonSelectedConfig;
    switch (key) {
      case 'facil':
        config['fontColor'] = AppColors.levelButtonTextFacil;
        config['boderColor'] = AppColors.levelButtonBorderFacil;
        return config;
      case 'medio':
        config['fontColor'] = AppColors.levelButtonTextMedio;
        config['boderColor'] = AppColors.levelButtonBorderMedio;
        return config;
      case 'dificil':
        config['fontColor'] = AppColors.levelButtonTextDificil;
        config['boderColor'] = AppColors.levelButtonBorderDificil;
        return config;
      case 'perito':
        config['fontColor'] = AppColors.levelButtonTextPerito;
        config['boderColor'] = AppColors.levelButtonBorderPerito;
        return config;
      default:
        return levelButtonSelectedConfig;
    }
  }

  //Button
  static final Color primary = Color(0xFF04D361);
  static final Color secondary = Color(0xFF04D361);
}
