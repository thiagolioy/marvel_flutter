import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/services/api_service.dart';
import 'package:marvel/models/character.dart';

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

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> implements MyAppBarDelegate{
  
  final service = FakeAPIService();

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
    return CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: MyAppBar(this),
        body: FutureBuilder<List<Character>>(
          future: service.fetchCharacters(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
              ? CharactersList(characters: snapshot.data)
              : Center(child: CircularProgressIndicator());
          },
        )
        
      ),
    );
  }
}

class CharactersList extends StatelessWidget {
  final List<Character> characters;

  CharactersList({Key key, this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return Text(characters[index].name);
      },
    );
  }
}

abstract class MyAppBarDelegate {
  void didClickGridIcon();
  void didClickListIcon();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MyAppBarDelegate delegate;

  MyAppBar(this.delegate);

  void switchToGrid() {
    delegate.didClickGridIcon();
  }
  void switchToList() {
    delegate.didClickListIcon();
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Characters"),
      actions: <Widget>[
        FlatButton(
          onPressed: switchToGrid,
          child: Image.asset(
            "assets/images/grid_icon.png",
            width: 22,
            height: 22,
          ),
        ),
        FlatButton(
          onPressed: switchToList,
          child: Image.asset(
            "assets/images/list_icon.png",
            width: 22,
            height: 22,
          ),
        ),
      ],
    );
  }
}
