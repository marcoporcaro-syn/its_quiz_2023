import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text_style.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.text,
    required this.onClick,
    required this.status,
    Key? key}) : super(key: key);

  final String text;
  final Function onClick;
  final AnswerButtonStatus status;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = answerNotGivenButtonColor;

    switch(status) {
      case AnswerButtonStatus.NOT_ANSWERED:
        backgroundColor = answerNotGivenButtonColor;
        break;
      case AnswerButtonStatus.RIGHT:
        backgroundColor = rightAnswerButtonColor;
        break;
      case AnswerButtonStatus.WRONG:
        backgroundColor = wrongAnswerButtonColor;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: backgroundColor,
          ),
          onPressed: () {
            onClick();
          },
          child: Text(text,
            style: answerTextStyle
          ),
        ),
      ),
    );
  }
}


enum AnswerButtonStatus {
  NOT_ANSWERED,
  RIGHT,
  WRONG
}