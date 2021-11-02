import 'dart:math';
import 'package:class05_quiz_aap/quiz_brain.dart';
import 'package:class05_quiz_aap/result.dart';

import 'main.dart';

QuizBrain quizHistory = QuizBrain();

class ResultFile {
  var _resultBank = [];

  List<dynamic> display() {
    if (wrongattempedquestions.isNotEmpty) {
      for (int zz = 0; zz < wrongattempedquestions.length; zz++) {
        _resultBank.add(quizHistory.wrongAnswered(wrongattempedquestions[zz]));
        return _resultBank;
      }
    } else {
      _resultBank.add("Congrats your all questions are correct");
    }
    return _resultBank;
  }

  String question(int a) {
    return _resultBank.elementAt(a).questionText;
  }

  bool right(int a) {
    return _resultBank.elementAt(a).rightAnswer;
  }

  bool wrongAns(int a) {
    return _resultBank.elementAt(a).yourAnswer;
  }
}
