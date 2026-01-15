class HomeState {
  final String searchText;
  final String selectedCategory;

  HomeState({this.searchText = '', this.selectedCategory = 'All'});

  HomeState copyWith({String? searchText, String? selectedCategory}) {
    return HomeState(
      searchText: searchText ?? this.searchText,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
