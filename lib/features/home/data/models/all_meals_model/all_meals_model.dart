import 'package:equatable/equatable.dart';
import 'package:recipeapp/core/models/meal.dart';

class AllMealsModel extends Equatable {
  final List<Meal>? meals;

  const AllMealsModel({this.meals});

  factory AllMealsModel.fromJson(Map<String, dynamic> json) => AllMealsModel(
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
