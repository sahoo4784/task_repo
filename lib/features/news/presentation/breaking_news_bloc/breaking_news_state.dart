
import 'package:cmstask_repo/features/news/domain/entities/breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/entities/breaking_news.dart';
import 'package:equatable/equatable.dart';

abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState();

  @override
  List<Object> get props => [];
}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoading extends BreakingNewsState {}

class BreakingNewsLoaded extends BreakingNewsState {
  final List<BreakingNews> breakingNews;

  const BreakingNewsLoaded({required this.breakingNews});

  @override
  List<Object> get props => [breakingNews];
}

class BreakingNewsError extends BreakingNewsState {
  final String message;

  const BreakingNewsError({required this.message});

  @override
  List<Object> get props => [message];
}
