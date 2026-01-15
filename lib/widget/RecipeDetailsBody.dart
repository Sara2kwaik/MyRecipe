import 'package:app_test_flutter/cubits/recipe_details/RecipeDetailsState.dart';
import 'package:app_test_flutter/cubits/recipe_details/recipeDetails_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsBody extends StatelessWidget {
  const RecipeDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(92, 245, 245, 245),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                recipeImage(state, context),
                const SizedBox(height: 16),
                authorCard(state),
                const SizedBox(height: 16),
                ingredientsCard(state),
                const SizedBox(height: 16),
                instructionsCard(state),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------------- IMAGE ----------------
  Widget recipeImage(RecipeDetailsState state, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            state.imageUrl,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                state.liked ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                context.read<RecipeDetailsCubit>().toggleLike();
              },
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- AUTHOR CARD ----------------
  Widget authorCard(RecipeDetailsState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                infoItem(Icons.access_time, state.time),
                infoItem(Icons.favorite, '${state.likes} likes'),
              ],
            ),
            const Divider(height: 24),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              title: Text(state.author),
              subtitle: const Text('Recipe author'),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ---------------- INGREDIENTS ----------------
  Widget ingredientsCard(RecipeDetailsState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...state.ingredients.map((e) => ingredientItem(e)).toList(),
          ],
        ),
      ),
    );
  }

  Widget ingredientItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: const [
          Icon(Icons.circle, size: 6, color: Colors.orange),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  // ---------------- INSTRUCTIONS ----------------
  Widget instructionsCard(RecipeDetailsState state) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Instructions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...state.steps.asMap().entries.map(
              (e) => stepItem(e.key + 1, e.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orange,
            child: Text(
              number.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
