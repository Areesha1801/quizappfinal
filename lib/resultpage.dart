import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:class05_quiz_aap/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'main.dart';

class LastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Result Page'),
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
        child: Page(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
/*for (int l = 0; l < resultFile.display().length; l++) ...[
          Container(
              child: Row(
            children: [
              Text("Question: "),
              Text(resultFile.question(l)),
              Text("Correct Answer: "),
              Text(resultFile.right(l).toString()),
              Text("Your Answer: "),
              Text(resultFile.wrongAns(l).toString()),
            ],
          ))
        ]*/
          SizedBox(
            height: 100,
          ),
          Text(
            "Question: ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text(
            resultFile.display().toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
