import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/services/service_locator.dart';
import 'package:recipeapp/features/Search/presentation/views/search_view.dart';
import 'package:recipeapp/features/home/data/repos/all%20categories%20repo/get_all_categories_repo.dart';
import 'package:recipeapp/features/home/data/repos/all%20meals%20repo/get_all_meals_repo.dart';
import 'package:recipeapp/features/home/manager/all%20meals%20cubit/all_meals_cubit.dart';
import 'package:recipeapp/features/home/manager/categories%20cubit/get_all_categories_cubit.dart';
import 'package:recipeapp/features/home/presentation/views/home_view.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/recipies_List.dart';
import 'package:recipeapp/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:recipeapp/features/recipie%20details/data/repos/meal%20details/meal_deails_repo.dart';
import 'package:recipeapp/features/recipie%20details/manager/meal%20details%20cubit/meal_details_cubit.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/recipie_details_view.dart';
import 'package:recipeapp/features/splash/presentation/views/splash_view.dart';

class AppRoute {
  static const splashView = '/';
  static const onboardingView = '/onboardingView';
  static const homeView = '/homeView';
  static const recipieDetailsView = '/recipieDetailsView';
  static const recipiesListView = '/recipiesListView';
  static const searchView = '/searchView';

  static final goRouter = GoRouter(
    routes: [
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnboardingView(),
      ),

      GoRoute(
        path: homeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              GetAllCategoriesCubit(getIt<GetAllCategoriesRepo>())
                ..getAllCuisines(),
          child: HomeView(),
        ),
      ),
      GoRoute(
        path: recipieDetailsView,
        builder: (context, state) {
          final extraData = state.extra as Map<String?, String?>;
          final String mealId = extraData['mealId'] as String;
          final String mealName = extraData['mealName'] as String;

          return BlocProvider(
            create: (context) =>
                MealDetailsCubit(getIt<MealDetailsRepo>())
                  ..mealDeails(mealId: mealId),
            child: RecipieDetailsView(mealName: mealName),
          );
        },
      ),
      GoRoute(
        path: recipiesListView,
        builder: (context, state) {
          final category = state.extra as String;
          return BlocProvider(
            create: (context) =>
                AllMealsCubit(getIt<GetAllMealsRepo>())
                  ..getAllMeals(category: category),
            child: RecipiesList(categoryName: category),
          );
        },
      ),
      GoRoute(path: searchView, builder: (context, state) => SearchView()),
    ],
  );
}
