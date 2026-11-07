import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/services/api_service.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/Search/data/repos/search_repo.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, MealDetailsModel>> searchMeal({
    required String mealName,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await apiService.getData(
        endPoint: 'search.php?s=$mealName',
        cancelToken: cancelToken,
      );
      MealDetailsModel searchModel = MealDetailsModel.fromJson(response);
      return right(searchModel);
    } catch (e) {
      if (e is DioException) {
        if (CancelToken.isCancel(e)) {
          log('request cancelled');
          return left(ServerFailure(errMessage: 'Request cancelled'));
        }
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
