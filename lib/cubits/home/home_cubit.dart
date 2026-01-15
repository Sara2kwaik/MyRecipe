import 'package:app_test_flutter/cubits/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void updateSearch(String value) {
    emit(state.copyWith(searchText: value));
  }

  void changeCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }
}
