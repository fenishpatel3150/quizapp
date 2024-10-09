

class Category {
  String image;
  String quiz;
  String category;
  List<Question> questions;

  Category({required this.category, required this.questions,required this.quiz,required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    var questionList = json['questions'] as List;
    List<Question> questions = questionList.map((i) => Question.fromJson(i)).toList();

    return Category(
      image:json['image'],
      quiz:json['quiz'],
      category: json['category'],
      questions: questions,
    );
  }

}

class Question {
  String question;
  List<String> options;
  String answer;

  Question({required this.question, required this.options, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = json['options'] as List;
    List<String> options = List<String>.from(optionsList);

    return Question(
      question: json['question'],
      options: options,
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}
