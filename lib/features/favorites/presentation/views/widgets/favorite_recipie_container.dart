import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/favorites/presentation/views/widgets/favorite_recipie_details.dart';
import 'package:recipeapp/core/models/meal.dart';

class FavoriteRecipieContainer extends StatelessWidget {
  const FavoriteRecipieContainer({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all(color: AppColors.white),
      ),

      child: FavoriteRecipieDetails(meal: meal),
    );
  }
}
