import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  const Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    idCategory: json['idCategory'] as String?,
    strCategory: json['strCategory'] as String?,
    strCategoryThumb: json['strCategoryThumb'] as String?,
    strCategoryDescription: json['strCategoryDescription'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'idCategory': idCategory,
    'strCategory': strCategory,
    'strCategoryThumb': strCategoryThumb,
    'strCategoryDescription': strCategoryDescription,
  };

  @override
  List<Object?> get props {
    return [idCategory, strCategory, strCategoryThumb, strCategoryDescription];
  }
}
