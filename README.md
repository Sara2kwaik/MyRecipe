
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


# app_test_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
75e8954 (Initial commit - Flutter project setup)
