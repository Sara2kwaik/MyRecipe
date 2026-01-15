import 'package:app_test_flutter/cubits/auth/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(AuthLoading());

    await Future.delayed(Duration(seconds: 1)); // simulate API
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthAuthenticated());
    } catch (error) {
      emit(AuthError("Invalid email or password"));
    }

    // if (email == "test@test.com" && password == "123456") {
    //   emit(AuthAuthenticated());
    // } else {
    //   emit(AuthError("Invalid email or password"));
    // }
  }

  void register({required String email, required String password}) async {
    emit(AuthLoading());

    await Future.delayed(Duration(seconds: 1));

    emit(AuthAuthenticated());
  }

  void logout() {
    emit(AuthUnauthenticated());
  }
}
