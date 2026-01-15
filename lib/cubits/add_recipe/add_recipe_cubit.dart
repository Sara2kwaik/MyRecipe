import 'package:bloc/bloc.dart';
import 'add_recipe_state.dart';

class AddRecipeCubit extends Cubit<AddRecipeState> {
  AddRecipeCubit() : super(AddRecipeState());

  // تحديث الحقول الأساسية
  void updateRecipeName(String name) => emit(state.copyWith(recipeName: name));
  void updateImageUrl(String url) => emit(state.copyWith(imageUrl: url));
  void updatePrepTime(String time) => emit(state.copyWith(prepTime: time));
  void updateServings(int count) => emit(state.copyWith(servings: count));

  // إدارة الفئات
  void updateCategories(List<String> categories) =>
      emit(state.copyWith(categories: categories));

  // إدارة المكونات
  void addIngredient(String ingredient) {
    final updated = List<String>.from(state.ingredients)..add(ingredient);
    emit(state.copyWith(ingredients: updated));
  }

  void removeIngredient(int index) {
    final updated = List<String>.from(state.ingredients)..removeAt(index);
    emit(state.copyWith(ingredients: updated));
  }

  // إدارة الخطوات
  void addStep(String step) {
    final updated = List<String>.from(state.steps)..add(step);
    emit(state.copyWith(steps: updated));
  }

  void removeStep(int index) {
    final updated = List<String>.from(state.steps)..removeAt(index);
    emit(state.copyWith(steps: updated));
  }

  // حفظ الوصفة (محاكاة)
  void saveRecipe() async {
    // هنا يمكن إضافة منطق Firebase أو API
    print("Saving recipe: ${state.recipeName}");
  }
}
