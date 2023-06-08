import 'package:flutter/material.dart';
import 'package:its_quiz_2023/component/answer_button.dart';
import 'package:its_quiz_2023/data/question_repository.dart';
import 'package:its_quiz_2023/theme/colors.dart';
import 'package:its_quiz_2023/theme/text_style.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final questionList = QuestionRepository().getQuestions();

  String? givenAnswer;
  int questionIndex = 0;

  pickAnswer(givenAnswer) {
    setState(() {
      this.givenAnswer = givenAnswer;
    });
  }

  goToNextAnswer() {
    setState(() {
      if (questionIndex < questionList.length - 1 && givenAnswer != null) {
        questionIndex++;
        givenAnswer = null;
      }
    });
  }

  goToPreviousAnswer() {
    setState(() {
      if (questionIndex > 0 && givenAnswer != null) {
        questionIndex--;
        givenAnswer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionList[questionIndex];
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/logo2.png",
                    height: 100,
                  ),
                ),
                Text(
                  currentQuestion.text,
                  style: questionTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(currentQuestion.imageUrl),
                  ),
                ),
                const SizedBox(height: 20),
                ...currentQuestion.answers.map((singleAnswer) {
                  var buttonStatus = AnswerButtonStatus.NOT_ANSWERED;
                  if (givenAnswer != null) {
                    if (singleAnswer == currentQuestion.rightAnswer) {
                      buttonStatus = AnswerButtonStatus.RIGHT;
                    }
                    if (singleAnswer == givenAnswer && givenAnswer != currentQuestion.rightAnswer) {
                      buttonStatus = AnswerButtonStatus.WRONG;
                    }
                  }

                  return AnswerButton(
                      text: singleAnswer, status: buttonStatus, onClick: () => givenAnswer == null ? pickAnswer(singleAnswer) : null);
                }).toList(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (questionIndex > 0)
                      ElevatedButton(
                          onPressed: () {
                            goToPreviousAnswer();
                          },
                          child: const Text("Indietro")
                      ),
                    Expanded(
                      child: Container(),
                    ),
                    if(questionIndex < questionList.length - 1)
                    ElevatedButton(
                        onPressed: () {
                          goToNextAnswer();
                        },
                        child: const Text("Avanti")
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
