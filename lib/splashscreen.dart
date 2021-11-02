import 'dart:async';
import 'package:class05_quiz_aap/splashscreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SplashScreen(),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          obj1.randomnumberprocess(),
        ),
      ],
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreenn()));
  }
}
