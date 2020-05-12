import 'package:flutter/material.dart';
import 'package:marvel/services/api_service.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/UI/widgets/MyAppBar.dart';
import 'package:marvel/UI/widgets/CharactersGrid.dart';

class CharactersPage extends StatefulWidget {
  
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage>
    implements MyAppBarDelegate {
  final service = FakeAPIService();

  void didSelectCharacter(Character char) {
    print("didClickOnCharacter " + char.name);
    Navigator.of(context).pushNamed(
      "/character",
      arguments: char,
    );
  }

  @override
  void didClickGridIcon() {
    print("didClickGridIcon");
  }

  @override
  void didClickListIcon() {
    print("didClickListIcon");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF464343),
        appBar: MyAppBar(this),
        body: FutureBuilder<List<Character>>(
          future: service.fetchCharacters(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? CharactersGrid(
                    characters: snapshot.data,
                    callback: this.didSelectCharacter)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
