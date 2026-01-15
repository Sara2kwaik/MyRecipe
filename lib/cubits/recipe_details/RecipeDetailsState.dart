class RecipeDetailsState {
  final String imageUrl;
  final String title;
  final String author;
  final String time;
  final int likes;
  final bool liked;
  final List<String> ingredients;
  final List<String> steps;

  RecipeDetailsState({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.likes,
    this.liked = false,
    required this.ingredients,
    required this.steps,
  });

  RecipeDetailsState copyWith({
    String? imageUrl,
    String? title,
    String? author,
    String? time,
    int? likes,
    bool? liked,
    List<String>? ingredients,
    List<String>? steps,
  }) {
    return RecipeDetailsState(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      author: author ?? this.author,
      time: time ?? this.time,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }
}
