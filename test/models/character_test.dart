
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/models/character.dart';



void main() {
  dynamic json;
  dynamic jsonArray;

  setUp(() async {
    final file = new File('test_resources/character.json');
    json = jsonDecode(await file.readAsString());

    final fileArray = new File('test_resources/characters.json');
    jsonArray = jsonDecode(await fileArray.readAsString()).cast<Map<String, dynamic>>();
  });

  test('Should be able to parse Json from string', () async {
    expect(Character.fromJson(json), isNotNull);
  });

  test('Should be able to parse JsonArray from string', () async {
    expect(Character.fromJsonArray(jsonArray), isNotNull);
  });
}