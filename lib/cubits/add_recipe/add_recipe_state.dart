class AddRecipeState {
  final String recipeName;
  final String imageUrl;
  final String prepTime;
  final int servings;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;

  AddRecipeState({
    this.recipeName = "",
    this.imageUrl = "",
    this.prepTime = "",
    this.servings = 1,
    this.categories = const [],
    this.ingredients = const [],
    this.steps = const [],
  });

  AddRecipeState copyWith({
    String? recipeName,
    String? imageUrl,
    String? prepTime,
    int? servings,
    List<String>? categories,
    List<String>? ingredients,
    List<String>? steps,
  }) {
    return AddRecipeState(
      recipeName: recipeName ?? this.recipeName,
      imageUrl: imageUrl ?? this.imageUrl,
      prepTime: prepTime ?? this.prepTime,
      servings: servings ?? this.servings,
      categories: categories ?? this.categories,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }
}
