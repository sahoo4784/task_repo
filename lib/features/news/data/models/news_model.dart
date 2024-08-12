import 'package:equatable/equatable.dart';

class BreakingNewsModel extends Equatable {
  final String id;
  final String title;
  final String coverImage;
  final String related;
  final String published;
  final String newsViews;
  final String category;
  final String summary;

  const BreakingNewsModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.related,
    required this.published,
    required this.newsViews,
    required this.category,
    required this.summary,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    coverImage,
    related,
    published,
    newsViews,
    category,
    summary,
  ];

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverImage: json['coverImage'] as String,
      related: json['related'] as String,
      published: json['published'] as String,
      newsViews: json['newsViews'] as String,
      category: json['category'] as String,
      summary: json['summary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'coverImage': coverImage,
      'related': related,
      'published': published,
      'newsViews': newsViews,
      'category': category,
      'summary': summary,
    };
  }
}
