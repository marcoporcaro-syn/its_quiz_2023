import 'dart:convert';
import 'package:its_quiz_2023/data/question.dart';
import 'package:http/http.dart' as http;

class QuestionRepository {

  static const baseUrl = "https://run.mocky.io/v3/";
  static const questionUrl = "${baseUrl}a632ffc7-ba58-4721-8df7-8cb131da54bb";

  Future<List<Question>> getLocalQuestions() async {
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

  Future<List<Question>> getQuestionsFromApi() async {
    //endpoint
    final uri = Uri.parse(questionUrl);
    //make the api call and store it in a response variable
    final response = await http.get(uri);
    //response body is a string
    final jsonString = response.body;
    //decode the string into a map
    final responseMap = jsonDecode(jsonString);
    //convert the map into a list of Question objects
    final questionList = responseMap.map((json) => Question.fromJson(json)).toList().cast<Question>();
    //return the Question list
    return questionList;
  }

}
