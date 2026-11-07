import 'package:get_it/get_it.dart';
import 'package:recipeapp/core/services/api_service.dart';
import 'package:recipeapp/core/services/local_db.dart';
import 'package:recipeapp/features/Search/data/repos/search_repo.dart';
import 'package:recipeapp/features/Search/data/repos/search_repo_impl.dart';
import 'package:recipeapp/features/home/data/repos/all%20categories%20repo/get_all_categories_repo.dart';
import 'package:recipeapp/features/home/data/repos/all%20categories%20repo/get_all_categories_repo_impl.dart';
import 'package:recipeapp/features/home/data/repos/all%20meals%20repo/get_all_meals_repo.dart';
import 'package:recipeapp/features/home/data/repos/all%20meals%20repo/get_all_meals_repo_impl.dart';
import 'package:recipeapp/features/recipie%20details/data/repos/meal%20details/meal_deails_repo.dart';
import 'package:recipeapp/features/recipie%20details/data/repos/meal%20details/meal_details_repo_impl.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => (ApiService()));

  getIt.registerLazySingleton<GetAllCategoriesRepo>(
    () => (GetAllCategoriesRepoImpl(apiService: getIt<ApiService>())),
  );

  getIt.registerLazySingleton<GetAllMealsRepo>(
    () => (GetAllMealsRepoImpl(apiService: getIt<ApiService>())),
  );

  getIt.registerLazySingleton<MealDetailsRepo>(
    () => (MealDetailsRepoImpl(apiService: getIt<ApiService>())),
  );

  getIt.registerLazySingleton<LocalDb>(() => LocalDb());

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(apiService: getIt<ApiService>()),
  );
}
