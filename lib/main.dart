import 'dart:async';
import 'package:class05_quiz_aap/resultfile.dart';
import 'package:class05_quiz_aap/resultpage.dart';
import 'package:flutter/material.dart';
import 'contactus.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
ResultFile resultFile = ResultFile();
rnum obj1 = rnum();
int flag = 0;
List<int> notattempedquestions = List(10);
List<int> wrongattempedquestions = List(10);
List<int> rightattempedquestions = List(10);
int c = 0;
int right = 0;
int wrong = 0;
int remaining = 9 - (wrong + right);

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Quiz App'),
        actions: [
          IconButton(
            icon: Image.asset('images/img2.jpg'),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Row(
        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: Text(
                    'Areesha Asif',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Icon(Icons.account_box),
                Text('Total Question: 9'),
                Icon(Icons.clear),
                Text("Wrong Answers: $wrong"),
                Icon(Icons.check),
                Text("Correct Answers: $right"),
                Icon(Icons.account_balance_wallet_sharp),
                Text("Remaining Questions: $remaining"),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int _counter = 10;
  Timer _timer;
  int z = 0;
  void _startTimer() {
    _counter = 10;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else if (_counter == 0) {
          notattempedquestions[c] = quizBrain.endCheck();
          quizBrain.nextQuestion();
          _counter = 10;
          c++;
        } else if (quizBrain.endCheck() == 9 && _counter == 0) {
          if (quizBrain.isFinished() == true) {
            _showMyDialog(); //Alert dialogue box
            quizBrain.reset();
            scoreKeeper = [];
          }
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        _timer.cancel();
        remaining = 9 - (wrong + right);
        _showMyDialog();
        rightattempedquestions.clear();
        wrongattempedquestions.clear();
        scoreKeeper.clear();
        quizBrain.reset();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          rightattempedquestions[right] = quizBrain.endCheck();
          right++;
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          wrongattempedquestions[wrong] = quizBrain.endCheck();
          wrong++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Finished'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('number of questions you have not attempted: '),
                Text('$c'),
                Text('number of questions you attempted correctly: '),
                Text('$right'),
                Text('number of questions you attempted wrong: '),
                Text('$wrong'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Show Result'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LastPage()));
              },
            ),
            TextButton(
              child: const Text('Contact Us'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '$_counter\n ',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Text("\n"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                _startTimer();
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _startTimer();
                checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
