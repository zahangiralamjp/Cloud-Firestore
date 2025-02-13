class Recipe {
  String? id;
  String title;
  String description;
  String imageUrl;
  bool isFavorite;

  Recipe({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Recipe.fromMap(Map<String, dynamic> data, String id) {
    return Recipe(
      id: id,
      title: data['title'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      isFavorite: data['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
