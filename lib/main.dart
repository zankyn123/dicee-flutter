import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.red.shade900,
          title: Center(
              child: Text(
            'Dicee',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
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
  int indexLeft = 1;
  int indexRight = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                padding: WidgetStateProperty.all(EdgeInsets.all(16)),
              ),
              onPressed: () {
                changeDiceFace(DiceIndex.first);
              },
              child: Image.asset('images/dice$indexLeft.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                padding: WidgetStateProperty.all(EdgeInsets.all(16)),
              ),
              onPressed: () {
                changeDiceFace(DiceIndex.second);
              },
              child: Image.asset('images/dice$indexRight.png'),
            ),
          )
        ],
      ),
    );
  }

  void changeDiceFace(DiceIndex index) {
    // >= 1 & < 6
    setState(() {
      // switch (index) {
      //   case DiceIndex.first:
      //     indexLeft = Random().nextInt(6) + 1;
      //   case DiceIndex.second:
      //     indexRight = Random().nextInt(6) + 1;
      // }
      indexLeft = Random().nextInt(6) + 1;
      indexRight = Random().nextInt(6) + 1;
    });
  }
}

enum DiceIndex { first, second }
