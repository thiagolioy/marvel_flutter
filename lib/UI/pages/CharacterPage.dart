import 'package:flutter/material.dart';
import 'package:marvel/models/character.dart';

class CharacterPage extends StatelessWidget {
  final Character character;
  const CharacterPage({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF464343),
      appBar: AppBar(
        title: Text(this.character.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(this.character.thumbnail.fullPath()),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                this.character.name,
                style: TextStyle(
                  color: Color(0xFFc4c4c4),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
