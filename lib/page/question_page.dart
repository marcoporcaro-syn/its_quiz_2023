import 'package:flutter/material.dart';
import '../data/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final question = Question(
      text: "Quanti anni ha George Clooney?",
      answers: ["50", "62", "65"],
      rightAnswer: "62"
  );

  var displayMessage = "";

  pickAnswer({givenAnswer, rightAnswer}) {
    var message = "Risposta sbagliata";
    if (givenAnswer == rightAnswer) {
      message = "Risposta corretta";
    }
    setState(() {
      displayMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          Text(
            question.text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                pickAnswer(givenAnswer: question.answers[0], rightAnswer: question.rightAnswer);
              },
              child: Text(question.answers[0]),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                pickAnswer(givenAnswer: question.answers[1], rightAnswer: question.rightAnswer);
              },
              child: Text(question.answers[1]),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                pickAnswer(givenAnswer: question.answers[2], rightAnswer: question.rightAnswer);
              },
              child: Text(question.answers[2]),
            ),
          ),
          Text(
            displayMessage,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
