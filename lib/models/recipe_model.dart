class Recipe {
  final String title;
  final String image;
  final List ingredients;
  final List steps;

  Recipe({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] as String,
      image: json['image'] as String,
      ingredients: json['ingredients'] as List,
      steps: json['steps'] as List,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'ingredients': ingredients,
    'steps': steps,
  };
}
