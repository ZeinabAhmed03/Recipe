import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, MealDetailsModel>> searchMeal({
    required String mealName,
    CancelToken? cancelToken,
  });
}
