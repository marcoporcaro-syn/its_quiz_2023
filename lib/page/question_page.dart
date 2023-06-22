import 'package:flutter/material.dart';
import 'package:its_quiz_2023/component/answer_button.dart';
import 'package:its_quiz_2023/data/question.dart';
import 'package:its_quiz_2023/data/question_repository.dart';
import 'package:its_quiz_2023/theme/colors.dart';
import 'package:its_quiz_2023/theme/text_style.dart';

class QuestionPage extends StatefulWidget {
  final String category;

  const QuestionPage({super.key, required this.category});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  late Future<List<Question>> _futureQuestions;
  String? _givenAnswer;
  int _questionIndex = 0;
  int _questionSize = 0;

  @override
  void initState() {
    super.initState();
    _futureQuestions = QuestionRepository().getQuestions(widget.category);
  }

  _pickAnswer(givenAnswer) {
    setState(() {
      _givenAnswer = givenAnswer;
    });
    _goToNextQuestion();
  }

  _goToNextQuestion() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      if (_givenAnswer != null && _questionIndex < _questionSize - 1) {
        _questionIndex++;
        _givenAnswer = null;
      }
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
            child: FutureBuilder<List<Question>>(
                future: _futureQuestions,
                builder: (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
                  debugPrint("snapshot: ${snapshot.connectionState}");
                  //while waiting for data
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    debugPrint("snapshot: ${snapshot.error}");
                    return const Center(child: Text("Error while loading data", style: questionTextStyle));
                  }

                  final questionList = snapshot.data;
                  if (questionList == null) {
                    return const Center(
                        child: Text(
                      "No questions found ",
                      style: questionTextStyle,
                    ));
                  }

                  _questionSize = questionList.length;
                  final currentQuestion = questionList[_questionIndex];
                  return Column(
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
                        if (_givenAnswer != null) {
                          if (singleAnswer == currentQuestion.rightAnswer) {
                            buttonStatus = AnswerButtonStatus.RIGHT;
                          }
                          if (singleAnswer == _givenAnswer && _givenAnswer != currentQuestion.rightAnswer) {
                            buttonStatus = AnswerButtonStatus.WRONG;
                          }
                        }

                        return AnswerButton(
                            text: singleAnswer, status: buttonStatus, onClick: () => _givenAnswer == null ? _pickAnswer(singleAnswer) : null);
                      }).toList(),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
