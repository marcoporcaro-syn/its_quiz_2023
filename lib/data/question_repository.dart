import 'package:its_quiz_2023/data/question.dart';

class QuestionRepository {

  Future<List<Question>> getQuestions() async {
    final list = [
      Question(
          text: "Quanti anni ha George Clooney?",
          answers: ["50", "62", "65"],
          rightAnswer: "62",
          imageUrl: "https://wips.plug.it/cips/libero.it/magazine/cms/2022/04/george-clooney.jpg?w=785&h=494&a=c"),
      Question(
          text: "Quando è stata scoperta l'America",
          answers: ["1492", "1789", "1254"],
          rightAnswer: "1492",
          imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Portrait_of_a_Man%2C_Said_to_be_Christopher_Columbus.jpg/1200px-Portrait_of_a_Man%2C_Said_to_be_Christopher_Columbus.jpg"),
      Question(
          text: "Quanto vivono le tartarughe?",
          answers: ["90 anni", "3 anni", "troppo"],
          rightAnswer: "troppo",
          imageUrl: "https://petfamily.it/wp-content/uploads/2020/12/documenti_tartarughe.jpg")
    ];

    // We can await for the Future to complete and then return the list.
    //This will work in an async method only
    await Future.delayed(const Duration(seconds: 2));
    return list;

    // return Future.delayed(const Duration(seconds: 2), () => list);
  }
}
