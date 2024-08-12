// banner_widget.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/news/presentation/banner_bloc/banner_bloc.dart';
import 'package:cmstask_repo/features/news/presentation/banner_bloc/banner_event.dart';
import 'package:cmstask_repo/features/news/presentation/banner_bloc/banner_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    context.read<BannerBloc>(

    ).add(const LoadBannerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          if (state is BannerLoading) {
            return Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: Colors.grey.withOpacity(0.2),
              enabled: true,
              child: CarouselSlider.builder(
                itemCount: 4,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return const Text("");
                },
                options: CarouselOptions(
                  autoPlay: true,
                  height: 180,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
              ),
            );
          } else if (state is BannerLoaded) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.banners.length,
                  carouselController: _controller,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final banner = state.banners[itemIndex];
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: banner.coverImage,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Container(
                            height: 180,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  spreadRadius: 0,
                                  blurRadius: 30,
                                  offset: const Offset(0,15),
                                )
                              ],
                            ),
                            child: Image.asset(
                              Assets.errorImage,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ));
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 180,
                      enlargeCenterPage: true,
                      viewportFraction: 0.7,
                      aspectRatio: 2.0,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        setState(() {});
                        _current = index;
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.banners.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.red
                                        : Colors.red)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.3)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          } else if (state is BannerError) {
            return const Center(child: Text('Failed to load banners'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

// Similar widgets for CategoryWidget, NewsWidget
