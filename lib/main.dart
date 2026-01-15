import 'package:app_test_flutter/cubits/auth/auth_cubit.dart';
import 'package:app_test_flutter/feature/splash/presentation/AddRecipeScreen.dart';
import 'package:app_test_flutter/feature/splash/presentation/homeScreen.dart';
import 'package:app_test_flutter/feature/splash/presentation/splashView.dart';
import 'package:app_test_flutter/layout/Authication/login.dart';
import 'package:app_test_flutter/layout/Authication/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم جدًا
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthCubit())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Set the color of the status bar
        statusBarIconBrightness:
            Brightness.light, // Set the icon brightness (light or dark)
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      routes: {
        "/home": (context) => HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/addRecipe": (context) => AddRecipeScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.deepOrange,
        //   elevation: 20.0,
        // ),
      ),
    );
  }
}
