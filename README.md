# MyRecipe
A Flutter recipes app built with Cubit (flutter_bloc) and clean architecture


A Flutter mobile application that allows users to create, manage, and discover recipes.
The app is built using **Cubit (flutter_bloc)** for state management and follows a clean and scalable architecture.

---

## 🚀 Features
- User authentication (Login & Register) – Cubit based
- Profile management (View & Edit Profile)
- Add new recipes with ingredients and servings
- Browse and view recipe details
- Search and filter recipes
- Clean UI with Material Design
- Ready for Firebase integration

---

## State Management
This project uses **Cubit** from the `flutter_bloc` package to manage application state.
Business logic is fully separated from UI components.

---

## Tech Stack
- Flutter
- Dart
- flutter_bloc (Cubit)
- Material UI

---

## Project Structure
lib/
├── cubits/
│ ├── auth/
│ ├── profile/
│ ├── recipe/
│ └── home/
│
├── screens/
│ ├── auth/
│ ├── profile/
│ ├── recipes/
│ └── home/
│
├── widgets/
├── models/
└── main.dart

