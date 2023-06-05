import 'package:flutter/material.dart';
import 'package:its_quiz_2023/component/answer_button.dart';
import 'package:its_quiz_2023/theme/colors.dart';
import 'package:its_quiz_2023/theme/text_style.dart';
import '../data/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final question = Question(text: "Quanti anni ha George Clooney?", answers: ["50", "62", "65"], rightAnswer: "62");

  String? givenAnswer;

  pickAnswer(givenAnswer) {
    setState(() {
      this.givenAnswer = givenAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [backgroundColorStart, backgroundColorMiddle, backgroundColorEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.4, 1.0])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 20),
              Text(
                question.text,
                style: questionTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...question.answers.map((singleAnswer) {
                var buttonStatus = AnswerButtonStatus.NOT_ANSWERED;
                if(givenAnswer != null) {
                  if(singleAnswer == question.rightAnswer) {
                    buttonStatus = AnswerButtonStatus.RIGHT;
                  }
                  if(singleAnswer == givenAnswer && givenAnswer != question.rightAnswer) {
                    buttonStatus = AnswerButtonStatus.WRONG;
                  }
                }

                return AnswerButton(
                    text: singleAnswer,
                    status: buttonStatus,
                    onClick: () => givenAnswer == null ? pickAnswer(singleAnswer) : null
                );
              }).toList(),
              ElevatedButton(onPressed: () {
                setState((){
                  givenAnswer = null;
                });
              }, child: const Text("Ricomincia"))
            ],
            ),
          ),
        ),
      ),
    );
  }
}
