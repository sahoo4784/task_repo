
import 'package:cmstask_repo/features/news/data/repositories/news_repository.dart';
import 'package:cmstask_repo/features/news/domain/entities/banner.dart';

class FetchBanners {
  final NewsRepository repository;

  FetchBanners(this.repository);

  Future<List<Banner>> call() async {
    return await repository.fetchBanners();
  }
}

