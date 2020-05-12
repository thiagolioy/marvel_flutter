import 'package:flutter/material.dart';
import 'package:marvel/models/character.dart';

class CharacterPage extends StatelessWidget {
  final Character character;
  const CharacterPage({Key key, this.character}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.character.name),
      ),
      body: Column(
        children: <Widget>[
          Text(this.character.name),
        ],
      ),
    );
  }
}