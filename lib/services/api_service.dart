
import 'dart:convert';
import "package:marvel/models/character.dart";
import 'package:flutter/services.dart';

abstract class APIService {
  Future<List<Character>> fetchCharacters();
}

class JSONFileHelper {
  static Future<dynamic> fetch(String path) async {
    String jsonString = await rootBundle.loadString(path);
    final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsed;
  }
}

class FakeAPIService implements APIService {
  @override
  Future<List<Character>> fetchCharacters() async {
    final json = await JSONFileHelper.fetch("mocks/characters.json");
    List<Character> chars = Character.fromJsonArray(json);
    return chars;
  }
}

