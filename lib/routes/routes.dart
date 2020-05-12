import 'package:flutter/material.dart';
import 'package:marvel/UI/pages/CharacterPage.dart';
import 'package:marvel/UI/pages/CharactersPage.dart';
import 'package:marvel/models/character.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => CharactersPage());
      case "/character":
        if (args is Character) {
          return MaterialPageRoute(
              builder: (_) => CharacterPage(character: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text("Route Error")),
      );
    });
  }
}
