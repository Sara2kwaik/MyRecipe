abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess({required this.message});
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}

class RegisterCreateSuccess extends RegisterState {
  final String message;
  RegisterCreateSuccess({required this.message});
}

class RegisterCreateError extends RegisterState {
  final String error;
  RegisterCreateError({required this.error});
}
