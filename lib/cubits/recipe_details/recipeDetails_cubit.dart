import 'package:app_test_flutter/cubits/recipe_details/RecipeDetailsState.dart';
import 'package:bloc/bloc.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit({
    required String imageUrl,
    required String title,
    required String author,
    required String time,
    required int likes,
  }) : super(
         RecipeDetailsState(
           imageUrl: imageUrl,
           title: title,
           author: author,
           time: time,
           likes: likes,
           liked: false,
           ingredients: [],
           steps: [],
         ),
       );

  void toggleLike() {
    emit(
      state.copyWith(
        liked: !state.liked,
        likes: state.liked ? state.likes - 1 : state.likes + 1,
      ),
    );
  }
}
