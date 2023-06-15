class Question {

  late String text;
  late List<String> answers;
  late String rightAnswer;
  late String imageUrl;

  Question({
    required this.text,
    required this.answers,
    required this.rightAnswer,
    required this.imageUrl
  });

  Question.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    answers = json['answers'].cast<String>();
    rightAnswer = json['rightAnswer'];
    imageUrl = json['imageUrl'];
  }

}