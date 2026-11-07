import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/custom_card.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meals, required this.index});

  final List<Meal> meals;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(
        AppRoute.recipieDetailsView,
        extra: {
          'mealName': meals[index].strMeal,
          'mealId': meals[index].idMeal,
        },
      ),
      child: Column(
        children: [
          CustomImageCard(
            cardBody: CachedNetworkImage(
              imageUrl: meals[index].strMealThumb!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.transparent,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CustomLoadingIndicator(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            meals[index].strMeal!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: AppAssets.fontFamily,
              color: AppColors.mainAppColor,
            ),
          ),
        ],
      ),
    );
  }
}
