import 'package:dartz/dartz.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/home/data/models/all_meals_model/all_meals_model.dart';

abstract class GetAllMealsRepo {
  Future<Either<Failure, AllMealsModel>> getallMeals({
    required String category,
  });
}
