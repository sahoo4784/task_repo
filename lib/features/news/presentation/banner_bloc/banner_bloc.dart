
import 'package:bloc/bloc.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_banners.dart';
import 'banner_event.dart';
import 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final FetchBanners fetchBanners;

  BannerBloc({required this.fetchBanners}) : super(BannerInitial()) {
    on<LoadBannerEvent>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await fetchBanners();
        emit(BannerLoaded(banners: banners));
      } catch (e) {
        emit( const BannerError(message: 'Failed to load banners'));
      }
    });
  }
}

// Similar implementation for CategoryBloc and NewsBloc
