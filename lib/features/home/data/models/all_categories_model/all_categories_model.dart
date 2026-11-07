import 'package:equatable/equatable.dart';

import 'category.dart';

class AllCategoriesModel extends Equatable {
  final List<Category>? categories;

  const AllCategoriesModel({this.categories});

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    return AllCategoriesModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [categories];
}
