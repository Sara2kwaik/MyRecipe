abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String bio;
  final String profileImage;
  final int recipesCount;
  final int likesReceived;
  final int likesGiven;

  ProfileLoaded({
    required this.name,
    required this.email,
    required this.bio,
    required this.profileImage,
    required this.recipesCount,
    required this.likesReceived,
    required this.likesGiven,
  });
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError({required this.error});
}
