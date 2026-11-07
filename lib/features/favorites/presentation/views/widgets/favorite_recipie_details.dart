import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_actions.dart';

class FavoriteRecipieDetails extends StatelessWidget {
  const FavoriteRecipieDetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: meal.strMealThumb!,
              fit: BoxFit.fill,
              width: MediaQuery.sizeOf(context).width * 0.39,
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
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal!,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.language, color: AppColors.grey),
                    Text(
                      meal.strCountry!,
                      style: TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
                RecipieActions(mealDetails: meal),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
