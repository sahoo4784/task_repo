import 'package:cmstask_repo/features/news/domain/use_cases/fetch_banners.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_categories.dart';
import 'package:cmstask_repo/features/news/presentation/banner_bloc/banner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/helper/colors.dart';
import 'features/helper/constants.dart';
import 'features/helper/routes/routes.dart';
import 'features/news/domain/repositories/newsRepositoryImpl.dart';
import 'features/news/domain/use_cases/fetch_trending_news.dart';
import 'features/news/presentation/breaking_news_bloc/breaking_news_bloc.dart';
import 'features/news/presentation/category_bloc/category_bloc.dart';
import 'features/news/presentation/pages/news_home_screen.dart';
import 'features/news/presentation/trending_news_bloc/trending_news_bloc.dart';
import 'features/splash/presentation/splash_screen.dart';

void main() {
  final newsRepository = NewsRepositoryImpl(jsonFilePath: Assets.jsonPath);
  final fetchBanners = FetchBanners(newsRepository);
  final fetchCategories = FetchCategories(newsRepository);
  final fetchTrendingNews = FetchTrendingNews(newsRepository);
  final fetchBreakingNews = FetchBreakingNews(newsRepository);
  runApp(MyApp(
    fetchBanners: fetchBanners!,
    fetchCategories: fetchCategories! ,
    fetchTrendingNews: fetchTrendingNews! ,
    fetchBreakingNews: fetchBreakingNews! ,
  ));
}

class MyApp extends StatelessWidget {
  final FetchBanners fetchBanners;
  final FetchCategories fetchCategories;
  final FetchTrendingNews fetchTrendingNews;
  final FetchBreakingNews fetchBreakingNews;

  const MyApp({super.key, required this.fetchBanners,required this.fetchCategories, required this.fetchTrendingNews,required this.fetchBreakingNews});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BannerBloc>(
          lazy: false,
          create: (context) => BannerBloc(fetchBanners: fetchBanners),
        ),
        BlocProvider<CategoryBloc>(
          lazy: false,
          create: (context) => CategoryBloc(fetchCategories: fetchCategories),
        ),
        BlocProvider<TrendingNewsBloc>(
          lazy: false,
          create: (context) => TrendingNewsBloc(fetchTrendingNews: fetchTrendingNews),
        ),
        BlocProvider<BreakingNewsBloc>(
          lazy: false,
          create: (context) => BreakingNewsBloc(fetchBreakingNews: fetchBreakingNews),
        ),
      ],
      child: MaterialApp(
        title: 'CMS Task',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          textTheme: TextTheme(bodyMedium: GoogleFonts.poppins(fontSize: 14)),
          appBarTheme:  AppBarTheme(
            backgroundColor: AppColors.brickRed,
            elevation: 1.0,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.white), // Optional: Set title text style
          ),
          scaffoldBackgroundColor:
              AppColors.backgroundColor, // Set the body background color here
        ),
        routes: {
          '/': (_) => const SplashScreen(),
          Routes.homeScreen: (_) => NewsHomeScreen()
        },
      ),
    );
  }
}
