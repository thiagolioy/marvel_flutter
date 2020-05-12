import 'package:flutter/material.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/UI/widgets/CharacterGridWidget.dart';

class CharactersGrid extends StatelessWidget {
  final List<Character> characters;
  final void Function(Character) callback;

  const CharactersGrid({Key key, @required this.characters, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: CharacterGridWidget(
            character: characters[index],
          ),
          onTap: () {
            final char = this.characters[index];
            callback(char);
          },
        );
      },
    );
  }
}
