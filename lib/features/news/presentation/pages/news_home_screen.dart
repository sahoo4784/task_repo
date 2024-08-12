import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:cmstask_repo/features/news/presentation/widgets/banner_widget.dart';
import 'package:cmstask_repo/features/news/presentation/widgets/breaking_news_widget.dart';
import 'package:cmstask_repo/features/news/presentation/widgets/category_widget.dart';
import 'package:cmstask_repo/features/news/presentation/widgets/sidebar_menu.dart';
import 'package:cmstask_repo/features/news/presentation/widgets/trending_news_widget.dart';
import 'package:flutter/material.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.appName,
          style: TextStyles.boldWhiteTextStyle,
        ),
      ),
      endDrawer: SidebarMenu(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(),
              CategoryWidget(),
              TrendingNewsWidget(),
              BreakingNewsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
