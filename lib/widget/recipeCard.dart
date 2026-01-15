import 'package:app_test_flutter/cubits/recipe_details/recipeDetails_cubit.dart';
import 'package:app_test_flutter/feature/splash/presentation/RecipeDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String time;
  final int likes;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => RecipeDetailsCubit(
                imageUrl: imageUrl,
                title: title,
                author: author,
                time: time,
                likes: likes,
              ),
              child: RecipeDetails(),
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black26,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ----- صورة الطبق -----
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// ----- أيقونة القلب -----
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.black12),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.favorite, color: Colors.red, size: 22),
                    ),
                  ),
                ),
              ],
            ),

            /// ----- عنوان الوصفة -----
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            /// ----- الوقت -----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// ----- الكاتب + عدد الإعجابات -----
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// الكاتب
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        author,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),

                  /// اللايكات
                  Row(
                    children: [
                      const Icon(Icons.favorite_border, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        likes.toString(),
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
