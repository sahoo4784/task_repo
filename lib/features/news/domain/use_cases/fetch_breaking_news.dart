
import 'package:cmstask_repo/features/news/data/repositories/news_repository.dart';
import 'package:cmstask_repo/features/news/domain/entities/breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/entities/trending_news.dart';

class FetchBreakingNews {
  final NewsRepository repository;

  FetchBreakingNews(this.repository);

  Future<List<BreakingNews>> call() async {
    return await repository.fetchBreakingNews();
  }
}

