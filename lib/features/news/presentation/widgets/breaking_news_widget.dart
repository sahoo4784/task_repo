import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:cmstask_repo/features/news/presentation/breaking_news_bloc/breaking_news_bloc.dart';
import 'package:cmstask_repo/features/news/presentation/breaking_news_bloc/breaking_news_event.dart';
import 'package:cmstask_repo/features/news/presentation/breaking_news_bloc/breaking_news_state.dart';
import 'package:cmstask_repo/features/news/presentation/pages/breaking_news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingNewsWidget extends StatefulWidget {
  @override
  State<BreakingNewsWidget> createState() => _BreakingNewsWidgetState();
}

class _BreakingNewsWidgetState extends State<BreakingNewsWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<BreakingNewsBloc>().add(const LoadBreakingNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
        builder: (context, state) {
          if (state is BreakingNewsLoading) {
            return const SizedBox();
          } else if (state is BreakingNewsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.breakingNews,
                  style: TextStyles.boldBlackTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: state.breakingNews.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BreakingNewsDetailScreen(
                                id: state.breakingNews[index].id!,
                                title: state.breakingNews[index].title!,
                                image: state.breakingNews[index].coverImage!,
                                text: state.breakingNews[index].category!,
                                htmlDescription: state.breakingNews[index].summary!,
                              ),
                            ),
                          );
                        },
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.breakingNews[index].title,
                                    style: TextStyles.regularBlackTextStyle
                                        .copyWith(fontSize: 12),
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
                                      Text(
                                          state.breakingNews[index].published
                                              .toString(),
                                          style: TextStyles.regularGreyTextStyle
                                              .copyWith(fontSize: 12)),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            state.breakingNews[index].newsViews,
                                            style: TextStyles
                                                .regularGreyTextStyle
                                                .copyWith(fontSize: 11)),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text("Views",
                                            style: TextStyles
                                                .regularGreyTextStyle
                                                .copyWith(fontSize: 11)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Hero(
                              tag: 'imageHero${state.breakingNews[index].id}',
                              child: Container(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          state.breakingNews[index].coverImage,
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
                            ),
                          ]),
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            );
          } else if (state is BreakingNewsError) {
            return const Center(child: Text('Failed to load Breaking News'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

// Similar widgets for CategoryWidget, NewsWidget
