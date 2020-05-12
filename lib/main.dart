import 'package:flutter/material.dart';
import 'package:marvel/UI/pages/CharactersPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CharactersPage(),
    );
  }
}
