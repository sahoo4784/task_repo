

import 'package:cmstask_repo/features/news/domain/entities/trending_news.dart';
import 'package:equatable/equatable.dart';

abstract class TrendingNewsState extends Equatable {
  const TrendingNewsState();

  @override
  List<Object> get props => [];
}

class TrendingNewsInitial extends TrendingNewsState {}

class TrendingNewsLoading extends TrendingNewsState {}

class TrendingNewsLoaded extends TrendingNewsState {
  final List<TrendingNews> trendingNews;

  const TrendingNewsLoaded({required this.trendingNews});

  @override
  List<Object> get props => [trendingNews];
}

class TrendingNewsError extends TrendingNewsState {
  final String message;

  const TrendingNewsError({required this.message});

  @override
  List<Object> get props => [message];
}
