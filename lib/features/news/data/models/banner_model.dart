import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String id;
  final String title;
  final String coverImage;
  final String published;
  final String category;
  final String summary;

  const BannerModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.published,
    required this.category,
    required this.summary,
  });

  @override
  List<Object> get props => [id, title, coverImage, published, category, summary];

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      coverImage: json['coverImage'],
      published: json['published'],
      category: json['category'],
      summary: json['summary'],
    );
  }
}

