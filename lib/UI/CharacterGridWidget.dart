import 'package:flutter/material.dart';
import 'package:marvel/models/character.dart';

class CharacterGridWidget extends StatelessWidget {
  const CharacterGridWidget({
    Key key,
    @required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
            this.character.thumbnail.fullPath(),
            fit: BoxFit.fill,
          ),
        Positioned(
          bottom: 0,
          height: 40,
          width: 200, // Tried to use double.infinity with no luck
          child: NameContainer(title: this.character.name),
        )
      ],
    );
  }
}

class NameContainer extends StatelessWidget {
  const NameContainer({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000000).withOpacity(0.75),
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          this.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
