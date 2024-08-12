import 'package:equatable/equatable.dart';

abstract class BreakingNewsEvent extends Equatable {
  const BreakingNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadBreakingNews extends BreakingNewsEvent {
  const LoadBreakingNews();
}
