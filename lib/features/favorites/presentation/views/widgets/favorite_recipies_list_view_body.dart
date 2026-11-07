import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/favorites/presentation/views/widgets/favorite_recipie_container.dart';
import 'package:recipeapp/features/favorites/manager/favorites%20cubit/favorites_cubit.dart';

class FavoriteRecipiesListViewBody extends StatelessWidget {
  const FavoriteRecipiesListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesUpdated) {
          return state.favMeals.isNotEmpty
              ? ListView.builder(
                  itemCount: state.favMeals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        key: ValueKey(state.favMeals[index].idMeal),
                        onTap: () => GoRouter.of(context).push(
                          AppRoute.recipieDetailsView,
                          extra: {
                            'mealName': state.favMeals[index].strMeal,
                            'mealId': state.favMeals[index].idMeal,
                          },
                        ),
                        child: FavoriteRecipieContainer(
                          meal: state.favMeals[index],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'No Favorites Yet!',
                    style: TextStyle(
                      color: AppColors.mainAppColor,
                      fontFamily: AppAssets.fontFamily,
                      fontSize: 18,
                    ),
                  ),
                );
        } else {
          return Center(
            child: Text(
              'There was a problem loading your favorites please try agian later',
            ),
          );
        }
      },
    );
  }
}
