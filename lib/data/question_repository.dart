import 'dart:convert';
import 'package:its_quiz_2023/data/question.dart';
import 'package:http/http.dart' as http;

class QuestionRepository {

  static const baseUrl = "https://its2023-quiz-default-rtdb.europe-west1.firebasedatabase.app/questions/";
  static const categoriesUrl = "${baseUrl}categories.json";


  Future<List<String>> getCategories() async {
    final uri = Uri.parse(categoriesUrl);
    final response = await http.get(uri);
    final jsonString = response.body;
    final responseMap = jsonDecode(jsonString);
    final categoriesList = responseMap.cast<String>();
    return categoriesList;
  }


  Future<List<Question>> getQuestions(String category) async {
    //endpoint
    final uri = Uri.parse("$baseUrl$category.json");
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
