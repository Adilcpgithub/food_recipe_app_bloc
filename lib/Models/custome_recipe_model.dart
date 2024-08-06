class CustomeRecipeModel {
  final String title;
  final String cookingTime;
  final String ingredients;
  final String instructions;
  final String id;

  CustomeRecipeModel({
    required this.id,
    required this.title,
    required this.cookingTime,
    required this.ingredients,
    required this.instructions,
  });
}
/*factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      image: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]['hostedLargeUrl'] ?? ''
          : '',
      name: json['displayName'] ?? '',
      rating: json['rating']?.toString() ?? '',
      cookingTime: json['totalTime'] ?? '',
    );
  } */