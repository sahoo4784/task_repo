import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String catId;
  final String title;
  final String image;
  final String count;

  const Category({
    required this.catId,
    required this.title,
    required this.image,
    required this.count,
  });

  @override
  List<Object?> get props => [catId, title, image, count];

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      catId: json['catId'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      count: json['count'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'catId': catId,
      'title': title,
      'image': image,
      'count': count,
    };
  }
}
