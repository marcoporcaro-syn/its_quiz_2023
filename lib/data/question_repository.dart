
import 'package:its_quiz_2023/data/question.dart';

class QuestionRepository {

  getQuestion() {
    return Question(
        text: "Quanti anni ha George Clooney?",
        answers: ["50", "62", "65"],
        rightAnswer: "62",
        imageUrl: "https://wips.plug.it/cips/libero.it/magazine/cms/2022/04/george-clooney.jpg?w=785&h=494&a=c"
    );
  }

}