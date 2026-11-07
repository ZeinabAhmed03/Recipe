import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/services/api_service.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/home/data/models/all_meals_model/all_meals_model.dart';
import 'package:recipeapp/features/home/data/repos/all%20meals%20repo/get_all_meals_repo.dart';

class GetAllMealsRepoImpl extends GetAllMealsRepo {
  final ApiService apiService;

  GetAllMealsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, AllMealsModel>> getallMeals({
    required String category,
  }) async {
    final response = await apiService.getData(
      endPoint: 'filter.php?c=$category',
    );
    try {
      AllMealsModel allMeals = AllMealsModel.fromJson(response);
      return right(allMeals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
