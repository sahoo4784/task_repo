

import 'package:cmstask_repo/features/news/domain/use_cases/fetch_breaking_news.dart';
import 'package:cmstask_repo/features/news/presentation/breaking_news_bloc/breaking_news_event.dart';
import 'package:cmstask_repo/features/news/presentation/breaking_news_bloc/breaking_news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  final FetchBreakingNews fetchBreakingNews ;

  BreakingNewsBloc({required this.fetchBreakingNews}) : super(BreakingNewsInitial()) {
    on<LoadBreakingNews>((event, emit) async {
      emit(BreakingNewsLoading());
      try {
        final breakingNews = await fetchBreakingNews();
        emit(BreakingNewsLoaded(breakingNews: breakingNews));
      } catch (e) {
        emit(const BreakingNewsError(message: 'Failed to load Breaking news'));
      }
    });
  }
}

