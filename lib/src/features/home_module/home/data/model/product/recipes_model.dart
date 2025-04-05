class RecipesModel {
  final int? id;
  final String? name;
  final List<String>? ingredients;
  final List<String>? instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final String? difficulty;
  final String? cuisine;
  final int? caloriesPerServing;
  final List<String>? tags;
  final int? userId;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<String>? mealType;

  RecipesModel({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        ingredients:
            (json['ingredients'] as List<dynamic>?)?.cast<String>() ?? [],
        instructions:
            (json['instructions'] as List<dynamic>?)?.cast<String>() ?? [],
        prepTimeMinutes: json['prepTimeMinutes'] ?? 0,
        cookTimeMinutes: json['cookTimeMinutes'] ?? 0,
        servings: json['servings'] ?? 0,
        difficulty: json['difficulty'] ?? '',
        cuisine: json['cuisine'] ?? '',
        caloriesPerServing: json['caloriesPerServing'] ?? 0,
        tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
        userId: json['userId'] ?? 0,
        image: json['image'] ?? '',
        rating: json['rating'] ?? 0.0,
        reviewCount: json['reviewCount'] ?? 0,
        mealType: (json['mealType'] as List<dynamic>?)?.cast<String>() ?? [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients?.toList(),
        'instructions': instructions?.toList(),
        'prepTimeMinutes': prepTimeMinutes,
        'cookTimeMinutes': cookTimeMinutes,
        'servings': servings,
        'difficulty': difficulty,
        'cuisine': cuisine,
        'caloriesPerServing': caloriesPerServing,
        'tags': tags?.toList(),
        'userId': userId,
        'image': image,
        'rating': rating,
        'reviewCount': reviewCount,
        'mealType': mealType?.toList(),
      };
}
