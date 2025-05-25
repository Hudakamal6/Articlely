import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final List<String> categories = [
    'All',
    'Business',
    'Technology',
    'Sports',
    'Health',
    'Science',
    'Entertainment',
  ];
   int selectedIndex = 0 ;

  CategoryCubit() : super(const CategoryState(selectedCategory: 'All'));

  void selectCategory(String category , int index) {
    selectedIndex = index;
    emit(CategoryState(selectedCategory: category));
  }
}
