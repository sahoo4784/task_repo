import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String catId;
  final String title;
  final String image;
  final int count;

  const CategoryModel({
    required this.catId,
    required this.title,
    required this.image,
    required this.count,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      catId: json['catId'],
      title: json['title'],
      image: json['image'],
      count: int.parse(json['count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'catId': catId,
      'title': title,
      'image': image,
      'count': count.toString(),
    };
  }

  @override
  List<Object> get props => [catId, title, image, count];
}
