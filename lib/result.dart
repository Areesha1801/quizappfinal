class Result {
  String questionText;
  bool yourAnswer;
  bool rightAnswer;

  Result(String q, bool a, bool b) {
    questionText = q;
    rightAnswer = a;
    yourAnswer = b;
  }
}
