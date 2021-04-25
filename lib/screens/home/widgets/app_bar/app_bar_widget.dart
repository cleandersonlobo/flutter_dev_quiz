import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/app_gradients.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/screens/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel? user;
  final onImageTap;
  AppBarWidget({required this.user, this.onImageTap})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 260,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: 'Olá, ',
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user?.name ?? "Usuário",
                                    style: AppTextStyles.titleBold)
                              ])),
                          GestureDetector(
                            onDoubleTap: onImageTap,
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration: user?.photoUrl != ""
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              user?.photoUrl ?? "")))
                                  : null,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ScoreCardWidget(score: user?.score ?? 0),
                  )
                ],
              ),
            ));
}
