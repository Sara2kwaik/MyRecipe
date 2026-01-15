import 'package:app_test_flutter/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/Profile/profile_cubit.dart';
import '../cubits/Profile/profile_states.dart';
import 'EditProfileScreen.dart';
import 'recipeCard.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                profileHeaderCard(context, state),
                SizedBox(height: 16),
                myRecipesSection(context),
                SizedBox(height: 16),
                likedRecipesSection(),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Center(child: Text("Error: ${state.error}"));
        }
        return SizedBox();
      },
    );
  }

  Widget profileHeaderCard(BuildContext context, ProfileLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(state.profileImage),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(state.email, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 6),
                        Text(state.bio, style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_square, size: 25),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => EditProfileCubit(),
                            child: EditProfileScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Divider(height: 24, thickness: 1, color: Colors.grey.shade200),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    statItem(
                      Icons.restaurant,
                      state.recipesCount.toString(),
                      "Recipes",
                    ),
                    statItem(
                      Icons.favorite_border,
                      state.likesReceived.toString(),
                      "Likes Received",
                    ),
                    statItem(
                      Icons.favorite,
                      state.likesGiven.toString(),
                      "Likes Given",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color.fromRGBO(255, 152, 0, 1)),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget myRecipesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "My Recipes",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 60,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "You haven't created any recipes yet",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/addRecipe");
                    },
                    child: Text(
                      "Create Your First Recipe",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget likedRecipesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Liked Recipes",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          RecipeCard(
            imageUrl: "assets/food.jpg",
            title: "Creamy Pasta Carbonara",
            author: "Maria Rodriguez",
            time: "25 min",
            likes: 124,
          ),
          SizedBox(height: 12),
          RecipeCard(
            imageUrl: "assets/food33.jpg",
            title: "Creamy Pasta Carbonara",
            author: "Maria Rodriguez",
            time: "25 min",
            likes: 124,
          ),
        ],
      ),
    );
  }
}
