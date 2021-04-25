import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';

class InputBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool error;
  final String hintText;
  final onSubmitted;
  const InputBoxWidget({
    Key? key,
    required this.controller,
    this.label = "Github",
    this.hintText = "githubuser",
    this.onSubmitted,
    this.error = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyBold,
          ),
          SizedBox(height: 6),
          TextField(
            controller: controller,
            style: AppTextStyles.body15Bold,
            enableInteractiveSelection: true,
            onEditingComplete: onSubmitted,
            textInputAction: TextInputAction.send,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(const Radius.circular(10))),
                hintText: hintText,
                hintStyle: AppTextStyles.placeholder),
          ),
          if (error)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                "Usuário não encontrado.",
                style: AppTextStyles.bodyDarkRed,
              ),
            )
        ],
      ),
    );
  }
}
