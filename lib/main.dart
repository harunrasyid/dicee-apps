import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void randomizeNumber() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
    });
    setState(() {
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
              ),
              onPressed: randomizeNumber,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDice.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
              ),
              onPressed: randomizeNumber,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$rightDice.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
