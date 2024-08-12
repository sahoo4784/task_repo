
import 'package:cmstask_repo/features/news/data/repositories/news_repository.dart';
import 'package:cmstask_repo/features/news/domain/entities/trending_news.dart';

class FetchTrendingNews {
  final NewsRepository repository;

  FetchTrendingNews(this.repository);

  Future<List<TrendingNews>> call() async {
    return await repository.fetchTrendingNews();
  }
}

