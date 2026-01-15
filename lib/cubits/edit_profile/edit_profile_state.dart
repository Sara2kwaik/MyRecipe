import 'dart:io';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileLoaded extends EditProfileState {
  final File? avatarFile;
  final String avatarUrl;
  final String name;
  final String email;
  final String bio;

  EditProfileLoaded({
    this.avatarFile,
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.bio,
  });

  EditProfileLoaded copyWith({
    File? avatarFile,
    String? avatarUrl,
    String? name,
    String? email,
    String? bio,
  }) {
    return EditProfileLoaded(
      avatarFile: avatarFile ?? this.avatarFile,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
    );
  }
}

class EditProfileError extends EditProfileState {
  final String error;
  EditProfileError({required this.error});
}
