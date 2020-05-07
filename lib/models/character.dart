class Thumbnail {
  final String path;
  final String ext;

  Thumbnail({this.path, this.ext});

  String fullPath() {
    return path + ext;
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      path: json['path'] as String,
      ext: json['extension'] as String
    );
  }
}

class Character {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;

  Character({this.id, this.name, this.description, this.thumbnail});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: Thumbnail.fromJson(json["thumbnail"])
    );
  }

  static List<Character> fromJsonArray(List<Map<String, dynamic>> jsonArray) {
    return jsonArray.map<Character>((json) => Character.fromJson(json)).toList();
  }
}