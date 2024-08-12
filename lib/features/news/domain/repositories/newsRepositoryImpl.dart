import 'dart:convert';
import 'package:cmstask_repo/features/news/data/repositories/news_repository.dart';
import 'package:cmstask_repo/features/news/domain/entities/banner.dart';
import 'package:cmstask_repo/features/news/domain/entities/breaking_news.dart';
import 'package:cmstask_repo/features/news/domain/entities/category.dart';
import 'package:cmstask_repo/features/news/domain/entities/trending_news.dart';
import 'package:flutter/services.dart';

class NewsRepositoryImpl implements NewsRepository {
  final String jsonFilePath;

  NewsRepositoryImpl({required this.jsonFilePath});


  @override
  Future<List<Banner>> fetchBanners() async {
    final response = await rootBundle.loadString('assets/data_v2.json');
    final data = json.decode(response);
    final List banners = data['dashboard']['banners'];
    return banners.map((banner) => Banner.fromJson(banner)).toList();
  }

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await rootBundle.loadString('assets/data_v2.json');
    final data = json.decode(response);
    final List categories = data['dashboard']['categories'];
    return categories.map((category) => Category.fromJson(category)).toList();
  }


  @override
  Future<List<BreakingNews>> fetchBreakingNews() async {
    final response = await rootBundle.loadString('assets/data_v2.json');
    final data = json.decode(response);
    final List news = data['dashboard']['breaking_news'];
    return news.map((newsItem) => BreakingNews.fromJson(newsItem)).toList();
  }

  @override
  Future<List<TrendingNews>> fetchTrendingNews() async {
    final response = await rootBundle.loadString('assets/data_v2.json');
    final data = json.decode(response);
    final List news = data['dashboard']['trending_news'];
    return news.map((newsItem) => TrendingNews.fromJson(newsItem)).toList();
  }

}
