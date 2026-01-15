import 'package:bloc/bloc.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() async {
    emit(ProfileLoading());

    try {
      // محاكاة تحميل بيانات المستخدم
      await Future.delayed(Duration(seconds: 1));

      emit(
        ProfileLoaded(
          name: "John Doe",
          email: "sara@gmail.com",
          bio: "Food enthusiast and home chef",
          profileImage: "assets/profile.jpg",
          recipesCount: 0,
          likesReceived: 0,
          likesGiven: 4,
        ),
      );
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  void updateProfile({
    String? name,
    String? email,
    String? bio,
    String? profileImage,
    int? recipesCount,
    int? likesReceived,
    int? likesGiven,
  }) {
    if (state is ProfileLoaded) {
      final current = state as ProfileLoaded;
      emit(
        ProfileLoaded(
          name: name ?? current.name,
          email: email ?? current.email,
          bio: bio ?? current.bio,
          profileImage: profileImage ?? current.profileImage,
          recipesCount: recipesCount ?? current.recipesCount,
          likesReceived: likesReceived ?? current.likesReceived,
          likesGiven: likesGiven ?? current.likesGiven,
        ),
      );
    }
  }
}
