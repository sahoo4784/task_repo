// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/news/domain/repositories/newsRepositoryImpl.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_banners.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_categories.dart';
import 'package:cmstask_repo/features/news/domain/use_cases/fetch_trending_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cmstask_repo/main.dart';

void main() {
  final newsRepository = NewsRepositoryImpl(jsonFilePath: Assets.jsonPath);
  final fetchBanners = FetchBanners(newsRepository);
  final fetchCategories = FetchCategories(newsRepository);
  final fetchTrendingNews = FetchTrendingNews(newsRepository);
  final fetchBreakingNews = FetchBreakingNews(newsRepository);
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(fetchBanners: fetchBanners, fetchCategories:fetchCategories, fetchTrendingNews: fetchTrendingNews,fetchBreakingNews: fetchBreakingNews,));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
