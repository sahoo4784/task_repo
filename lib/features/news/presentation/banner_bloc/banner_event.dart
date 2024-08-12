// banner_event.dart
import 'package:equatable/equatable.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerEvent extends BannerEvent {
  const LoadBannerEvent();
}
