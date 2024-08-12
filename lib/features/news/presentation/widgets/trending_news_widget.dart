import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:cmstask_repo/features/news/presentation/pages/breaking_news_detail_screen.dart';
import 'package:cmstask_repo/features/news/presentation/pages/trending_news_detail_screen.dart';
import 'package:cmstask_repo/features/news/presentation/trending_news_bloc/trending_news_bloc.dart';
import 'package:cmstask_repo/features/news/presentation/trending_news_bloc/trending_news_event.dart';
import 'package:cmstask_repo/features/news/presentation/trending_news_bloc/trending_news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingNewsWidget extends StatefulWidget {
  @override
  State<TrendingNewsWidget> createState() => _TrendingNewsWidgetState();
}

class _TrendingNewsWidgetState extends State<TrendingNewsWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<TrendingNewsBloc>().add(const LoadTrendingNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: BlocBuilder<TrendingNewsBloc, TrendingNewsState>(
        builder: (context, state) {
          if (state is TrendingNewsLoading) {
            return const SizedBox();
          } else if (state is TrendingNewsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.trendingNews,
                  style: TextStyles.boldBlackTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: state.trendingNews.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrendingNewsDetailScreen(
                                id: state.trendingNews[index].id!,
                                title: state.trendingNews[index].title!,
                                image: state.trendingNews[index].coverImage!,
                                text: state.trendingNews[index].category!,
                                htmlDescription: state.trendingNews[index].summary!,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'imageHero2${state.trendingNews[index].id}',
                          child: Container(
                            height: 110,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            margin:
                                const EdgeInsets.only(bottom: 10.0, right: 15),
                            width: MediaQuery.of(context).size.width,
                            child: Row(children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          state.trendingNews[index].coverImage,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        Assets.errorImage,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.trendingNews[index].title,
                                      style: TextStyles.regularBlackTextStyle
                                          .copyWith(fontSize: 12),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Published on ",
                                            style: TextStyles.regularGreyTextStyle
                                                .copyWith(fontSize: 12)),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(state.trendingNews[index].published,
                                            style: TextStyles.regularGreyTextStyle
                                                .copyWith(fontSize: 12)),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 60,
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.brickRed
                                                  .withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 6,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye,
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                              state.trendingNews[index].newsViews,
                                              style: TextStyles
                                                  .regularBlackTextStyle
                                                  .copyWith(fontSize: 11)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            );
          } else if (state is TrendingNewsError) {
            return const Center(child: Text('Failed to load Trending News'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

// Similar widgets for CategoryWidget, NewsWidget
