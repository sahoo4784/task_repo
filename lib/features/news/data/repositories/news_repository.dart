
import 'package:cmstask_repo/features/news/domain/entities/banner.dart';
import 'package:cmstask_repo/features/news/domain/entities/breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/entities/category.dart';
import 'package:cmstask_repo/features/news/domain/entities/trending_news.dart';


abstract class NewsRepository {
  Future<List<Banner>> fetchBanners();
  Future<List<Category>> fetchCategories();
  Future<List<TrendingNews>> fetchTrendingNews();
  Future<List<BreakingNews>> fetchBreakingNews();
}
