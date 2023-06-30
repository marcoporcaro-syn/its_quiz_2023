import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CategoryRepository {

  static const baseUrl = "https://its2023-quiz-default-rtdb.europe-west1.firebasedatabase.app/questions/";
  static const categoriesUrl = "${baseUrl}categories.json";
  static const _categoryKey = "category";

  Future<List<String>> getCategories() async {
    final uri = Uri.parse(categoriesUrl);
    final response = await http.get(uri);
    final jsonString = response.body;
    final responseMap = jsonDecode(jsonString);
    final categoriesList = responseMap.cast<String>();
    return categoriesList;
  }

  Future<bool> saveCategory(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_categoryKey, category);
  }


  Future<String?> readCategoryFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_categoryKey);
  }

}