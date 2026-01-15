import 'dart:io';
import 'package:bloc/bloc.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit()
    : super(
        EditProfileLoaded(
          avatarFile: null,
          avatarUrl:
              "https://images.unsplash.com/photo-1535713876302-d1d0cf377fde",
          name: "John Doe",
          email: "sara@gmail.com",
          bio: "Food enthusiast and home chef",
        ),
      );

  void updateName(String name) {
    if (state is EditProfileLoaded) {
      emit((state as EditProfileLoaded).copyWith(name: name));
    }
  }

  void updateEmail(String email) {
    if (state is EditProfileLoaded) {
      emit((state as EditProfileLoaded).copyWith(email: email));
    }
  }

  void updateBio(String bio) {
    if (state is EditProfileLoaded) {
      emit((state as EditProfileLoaded).copyWith(bio: bio));
    }
  }

  void updateAvatarFile(File file) {
    if (state is EditProfileLoaded) {
      emit((state as EditProfileLoaded).copyWith(avatarFile: file));
    }
  }

  void updateAvatarUrl(String url) {
    if (state is EditProfileLoaded) {
      emit((state as EditProfileLoaded).copyWith(avatarUrl: url));
    }
  }

  void saveProfile() async {
    if (state is EditProfileLoaded) {
      emit(EditProfileLoading());

      try {
        await Future.delayed(Duration(seconds: 1)); // محاكاة حفظ البيانات

        // بعد الحفظ، نرجع الحالة المحملة
        emit(state);
      } catch (e) {
        emit(EditProfileError(error: e.toString()));
      }
    }
  }
}
