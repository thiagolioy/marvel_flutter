class Character {
  final int id;
  final String name;
  final String description;

  Character({this.id, this.name, this.description});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  static List<Character> fromJsonArray(List<Map<String, dynamic>> jsonArray) {
    return jsonArray.map<Character>((json) => Character.fromJson(json)).toList();
  }
}