import 'package:english_words/english_words.dart';
import 'package:first_flutter_app_pt1/random_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            display1: TextStyle(fontSize: 18.0),
          ),
        ),
        title: 'Welcome to Flutter',
        home: RandomWords(),
      );
}
