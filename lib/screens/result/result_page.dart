import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_images.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/shared/widgets/button/button_widget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(AppImages.trophy)],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Parabéns!", style: AppTextStyles.titleDark),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Você concluiu", style: AppTextStyles.body15),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Gerencimento de Estado",
                      style: AppTextStyles.body15Bold),
                  SizedBox(
                    height: 6,
                  ),
                  Text("com 6 de 10 acertos", style: AppTextStyles.body15),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonWidget.secondary(
                      maxWidth: 240, label: "Compartilhar", onPress: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Voltar ao inicio",
                        style: AppTextStyles.body15Bold,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
