import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/helper/ApiService.dart';
import 'package:quizapp/model/QuizModel/QuizModel.dart';

class QuizController extends GetxController {
  var selectedIndex = (-1).obs; // To track selected option
  RxList<Category> quizList = <Category>[].obs;
  var currentCategoryIndex = 0.obs; // To track current quiz category
  RxInt questionIndex = 0.obs; // To track current question in a quiz
  RxInt totalScore = 0.obs; //// To store the user's score



  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    try {
      isLoading(true);
      quizList.value = await ApiService.apiService.fetchQuizData();
      quizList.refresh();
      print("-------------------------------------------------------");
      print(quizList.length);
    } catch (e) {
      errorMessage.value = 'Error fetching quiz data: $e';
    } finally {
      isLoading(false);
    }
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void checkAnswer(String selectedOption) {
    var correctAnswer = quizList[currentCategoryIndex.value]
        .questions[questionIndex.value]
        .answer;

    if (selectedOption == correctAnswer) {
      totalScore.value++;
    }

    nextQuestion();
  }

  // Move to the next question or show the result if the quiz is over
  void nextQuestion() {
    if (questionIndex.value < quizList[currentCategoryIndex.value].questions.length - 1) {
      questionIndex.value++;
      selectedIndex.value = -1; // Reset the selected index for the next question
    } else {
      // Quiz Completed - Show the score
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.white,
        titleText: Text(
          'Quiz Completed',
          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          'Total Score: ${totalScore.value}',
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(seconds: 3),
      ));
    }
  }

  void onlyOneCategory(int index)
  {
    currentCategoryIndex.value = index;
  }

  // Go back to the previous question
  void prevQuestion() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
      selectedIndex.value = -1; // Reset the selected index for the previous question
    }
  }
}
