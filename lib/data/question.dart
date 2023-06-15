class Question {
  late String text;
  late List<String> answers;
  late String rightAnswer;
  late String imageUrl;

  Question({required this.text, required this.answers, required this.rightAnswer, required this.imageUrl});

  // This is a named constructor that takes a map as input and returns a Question object
  Question.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    answers = json['answers'].cast<String>();
    rightAnswer = json['correctAnswer'];
    imageUrl = json['imageUrl'];
  }

  // This is a function that takes a map as input and returns a Question object
  // This shouldn't exist
  Question generateQuestionFromMap(Map<String, dynamic> json) {
    return Question(
      text: json['text'],
      answers: json['answers'].cast<String>(),
      rightAnswer: json['correctAnswer'],
      imageUrl: json['imageUrl'],
    );
  }
}
