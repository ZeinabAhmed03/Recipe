import 'package:equatable/equatable.dart';

import '../../../../../core/models/meal.dart';

class MealDetailsModel extends Equatable {
  final List<Meal>? meals;

  const MealDetailsModel({this.meals});

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    return MealDetailsModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
