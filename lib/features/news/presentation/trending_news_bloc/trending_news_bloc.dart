

import 'package:cmstask_repo/features/news/domain/use_cases/fetch_trending_news.dart';
import 'package:cmstask_repo/features/news/presentation/trending_news_bloc/trending_news_event.dart';
import 'package:cmstask_repo/features/news/presentation/trending_news_bloc/trending_news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingNewsBloc extends Bloc<TrendingNewsEvent, TrendingNewsState> {
  final FetchTrendingNews fetchTrendingNews ;

  TrendingNewsBloc({required this.fetchTrendingNews}) : super(TrendingNewsInitial()) {
    on<LoadTrendingNews>((event, emit) async {
      emit(TrendingNewsLoading());
      try {
        final trendingNews = await fetchTrendingNews();
        emit(TrendingNewsLoaded(trendingNews: trendingNews));
      } catch (e) {
        emit( const TrendingNewsError(message: 'Failed to load Trending news'));
      }
    });
  }
}

