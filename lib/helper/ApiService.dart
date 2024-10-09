import 'dart:convert';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:quizapp/model/QuizModel/QuizModel.dart';

class ApiService {
  static ApiService apiService = ApiService._();
  ApiService._();

  Future<List<Category>> fetchQuizData() async {
    try {

      final String response = await rootBundle.loadString('assets/json/quizdata.json');
      final List jsonResponse = json.decode(response);
      List<Category> quiz = jsonResponse.map((e) => Category.fromJson(e)).toList();
      print(quiz.length);

      return quiz;
    } catch (e) {
      throw Exception('Error fetching quiz data: $e');
    }
  }
}
