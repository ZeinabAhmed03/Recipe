import 'package:dartz/dartz.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/home/data/models/all_categories_model/all_categories_model.dart';

abstract class GetAllCategoriesRepo {
  Future<Either<Failure, AllCategoriesModel>> getAllCategories();
}
