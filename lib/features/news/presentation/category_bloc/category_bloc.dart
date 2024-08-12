import 'package:bloc/bloc.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_categories.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FetchCategories fetchCategories;

  CategoryBloc({required this.fetchCategories}) : super(CategoryInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await fetchCategories();
        emit(CategoryLoaded(categories: categories));
      } catch (e) {
        emit(const CategoryError(message: 'Failed to load categories'));
      }
    });
  }
}
