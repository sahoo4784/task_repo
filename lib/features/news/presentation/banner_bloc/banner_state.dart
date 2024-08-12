

import 'package:cmstask_repo/features/news/domain/entities/banner.dart';
import 'package:equatable/equatable.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<Banner> banners;

  const BannerLoaded({required this.banners});

  @override
  List<Object> get props => [banners];
}

class BannerError extends BannerState {
  final String message;

  const BannerError({required this.message});

  @override
  List<Object> get props => [message];
}
