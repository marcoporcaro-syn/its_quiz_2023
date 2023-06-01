import 'package:flutter/material.dart';
import 'package:its_quiz_2023/component/answer_button.dart';
import '../data/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final question = Question(text: "Quanti anni ha George Clooney?", answers: ["50", "62", "65", "46", "70"], rightAnswer: "62");

  var displayMessage = "";

  pickAnswer(givenAnswer) {
    var message = "Risposta sbagliata";
    if (givenAnswer == question.rightAnswer) {
      message = "Risposta corretta";
    }
    setState(() {
      displayMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 20),
            Text(
              question.text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: question.answers
                  .map((singleAnswer) =>
                  AnswerButton(
                      text: singleAnswer,
                      onClick: () => pickAnswer(singleAnswer))
              )
                  .toList(),
            ),
            Text(
              displayMessage,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
