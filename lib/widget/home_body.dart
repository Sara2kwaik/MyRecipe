import 'package:app_test_flutter/component/components.dart';
import 'package:app_test_flutter/cubits/home/home_cubit.dart';
import 'package:app_test_flutter/cubits/home/home_states.dart';
import 'package:app_test_flutter/feature/splash/presentation/AddRecipeScreen.dart';
import 'package:app_test_flutter/feature/splash/presentation/profileScreen.dart';
import 'package:app_test_flutter/widget/categoryFilter.dart';
import 'package:app_test_flutter/widget/recipeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    children: [
                      Text(
                        "My Recipes",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 120),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddRecipeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(
                          51,
                          158,
                          158,
                          158,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person_outline_outlined),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfileScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  hint: "Search recipes or ingredients.....",
                  textStyle: const TextStyle(fontSize: 15),
                  prefix: const Icon(Icons.search_outlined, color: Colors.grey),
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "You must enter your email";
                    }
                    return null;
                  },
                  onChange: (value) {
                    context.read<HomeCubit>().updateSearch(value);
                  },
                  bottomPadding: 15,
                ),
                CategoryFilter(
                  selectedCategory: state.selectedCategory,
                  onSelected: (category) {
                    context.read<HomeCubit>().changeCategory(category);
                  },
                ),
                SizedBox(height: 25),
                RecipeCard(
                  imageUrl: "assets/food.jpg",
                  title: "Creamy Pasta Carbonara",
                  author: "Maria Rodriguez",
                  time: "25 min",
                  likes: 124,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
