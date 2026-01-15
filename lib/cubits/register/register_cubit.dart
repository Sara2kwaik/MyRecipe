import 'package:app_test_flutter/cubits/register/register_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({
    required String fullname,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      emit(RegisterError(error: "Passwords do not match"));
      return;
    }

    emit(RegisterLoading());

    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSuccess(message: "User registered successfully!"));
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }

  void createUser({required String fullname, required String email}) {}
}
