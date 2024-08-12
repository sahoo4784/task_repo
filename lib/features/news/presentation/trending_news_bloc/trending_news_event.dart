import 'package:equatable/equatable.dart';

abstract class TrendingNewsEvent extends Equatable {
  const TrendingNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadTrendingNews extends TrendingNewsEvent {
  const LoadTrendingNews();
}
