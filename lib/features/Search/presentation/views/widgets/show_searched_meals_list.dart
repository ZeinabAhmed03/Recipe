import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';

class ShowSearchedMealsList extends StatelessWidget {
  const ShowSearchedMealsList({super.key, required this.meals});

  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            GoRouter.of(context).push(
              AppRoute.recipieDetailsView,
              extra: {
                'mealName': meals[index].strMeal,
                'mealId': meals[index].idMeal,
              },
            );
            await context.read<SearchCubit>().addToSearchHistory(
              meal: meals[index],
            );
          },
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: meals[index].strMealThumb!,

              fit: BoxFit.fill,
              width: MediaQuery.sizeOf(context).width * 0.20,
              placeholder: (context, url) => Container(
                color: AppColors.grey.shade50.withValues(alpha: 0.15),
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CustomLoadingIndicator(),
                  ),
                ),
              ),
            ),

            title: Text(
              meals[index].strMeal!,
              style: TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
                color: AppColors.white,
              ),
              maxLines: 1,
            ),
            subtitle: Text(
              meals[index].strCategory!,
              style: TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                color: AppColors.grey,
              ),
              maxLines: 1,
            ),
          ),
        );
      },
    );
  }
}
