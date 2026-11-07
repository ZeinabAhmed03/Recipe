import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/services/api_service.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';
import 'package:recipeapp/features/recipie%20details/data/repos/meal%20details/meal_deails_repo.dart';

class MealDetailsRepoImpl extends MealDetailsRepo {
  final ApiService apiService;

  MealDetailsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, MealDetailsModel>> getmealDetails({
    required String mealId,
  }) async {
    try {
      final response = await apiService.getData(
        endPoint: 'lookup.php?i=$mealId',
      );
      final MealDetailsModel mealDetails = MealDetailsModel.fromJson(response);
      return right(mealDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
