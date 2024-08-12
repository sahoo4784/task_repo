
import 'package:cmstask_repo/features/news/data/repositories/news_repository.dart';
import 'package:cmstask_repo/features/news/domain/entities/category.dart';

class FetchCategories {
  final NewsRepository repository;

  FetchCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.fetchCategories();
  }
}

