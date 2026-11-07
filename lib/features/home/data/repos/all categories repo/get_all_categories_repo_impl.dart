import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/services/api_service.dart';
import 'package:recipeapp/core/services/failure.dart';
import 'package:recipeapp/features/home/data/models/all_categories_model/all_categories_model.dart';
import 'package:recipeapp/features/home/data/repos/all%20categories%20repo/get_all_categories_repo.dart';

class GetAllCategoriesRepoImpl extends GetAllCategoriesRepo {
  final ApiService apiService;

  GetAllCategoriesRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, AllCategoriesModel>> getAllCategories() async {
    try {
      final response = await apiService.getData(endPoint: 'categories.php');

      AllCategoriesModel allCuisines = AllCategoriesModel.fromJson(response);
      return right(allCuisines);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
