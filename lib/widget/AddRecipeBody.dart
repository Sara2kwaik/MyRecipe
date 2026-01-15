import 'package:app_test_flutter/cubits/add_recipe/add_recipe_cubit.dart';
import 'package:app_test_flutter/cubits/add_recipe/add_recipe_state.dart';
import 'package:app_test_flutter/widget/categoryChips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRecipeBody extends StatelessWidget {
  final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController prepTimeController = TextEditingController();
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController stepController = TextEditingController();

  AddRecipeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddRecipeCubit(),
      child: BlocBuilder<AddRecipeCubit, AddRecipeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9F9F9),
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    basicInfoCard(context, state),
                    const SizedBox(height: 16),
                    ingredientsCard(context, state),
                    const SizedBox(height: 16),
                    instructionsCard(context, state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// -------------------- Basic Info --------------------
  Widget basicInfoCard(BuildContext context, AddRecipeState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Basic Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            textField(
              "Recipe Name",
              "Enter recipe name",
              controller: recipeNameController,
            ),
            const SizedBox(height: 12),
            textField(
              "Image URL",
              "https://images.unsplash.com/...",
              controller: imageUrlController,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: textField(
                    "Prep Time",
                    "e.g. 30 min",
                    controller: prepTimeController,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: servingsCounter(context, state)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CategoryChips(),
          ],
        ),
      ),
    );
  }

  Widget textField(
    String label,
    String hint, {
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  /// -------------------- Servings Counter --------------------
  Widget servingsCounter(BuildContext context, AddRecipeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Servings",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.servings.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.read<AddRecipeCubit>().updateServings(
                      state.servings + 1,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (state.servings > 1) {
                        context.read<AddRecipeCubit>().updateServings(
                          state.servings - 1,
                        );
                      }
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// -------------------- Ingredients --------------------
  Widget ingredientsCard(BuildContext context, AddRecipeState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () => addIngredient(context),
                  icon: const Icon(Icons.add, color: Colors.orange),
                  label: const Text(
                    "Add",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ingredientController,
              decoration: InputDecoration(
                hintText: "Ingredient ${state.ingredients.length + 1}",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...state.ingredients.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(item),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () => context
                          .read<AddRecipeCubit>()
                          .removeIngredient(index),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void addIngredient(BuildContext context) {
    if (ingredientController.text.trim().isEmpty) return;
    context.read<AddRecipeCubit>().addIngredient(
      ingredientController.text.trim(),
    );
    ingredientController.clear();
  }

  /// -------------------- Steps --------------------
  Widget instructionsCard(BuildContext context, AddRecipeState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Instructions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () => addStep(context),
                  icon: const Icon(Icons.add, color: Colors.orange),
                  label: const Text(
                    "Add",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: stepController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Step ${state.steps.length + 1}",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...state.steps.asMap().entries.map((entry) {
              int index = entry.key;
              String step = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(step),
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () =>
                          context.read<AddRecipeCubit>().removeStep(index),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void addStep(BuildContext context) {
    if (stepController.text.trim().isEmpty) return;
    context.read<AddRecipeCubit>().addStep(stepController.text.trim());
    stepController.clear();
  }
}
