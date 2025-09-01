/// Recipe class where we declare all necessary values for a recipe objet to work well
class Recipe {
  /// Unique identificator of the recipe
  final int id;

  /// Title of the recipe, the title must be descriptive
  final String title;

  /// Name of the image file for the recipe
  final String image;

  /// List of ingredients necessary for the recipe
  final List ingredients;

  /// List of the steps to cook the recipe
  final List steps;

  /// Recipe class constructor
  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });

  /// Method so serialize a json object into a Recipe one
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      ingredients: json['ingredients'] as List,
      steps: json['steps'] as List,
    );
  }

  /// Method to export a Recipe object into a json one
  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'ingredients': ingredients,
    'steps': steps,
  };
}
