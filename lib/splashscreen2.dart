import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreenn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreennState();
  }
}

class SplashScreennState extends State<SplashScreenn> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("images/img1.jpg")),
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp()));
  }
}
