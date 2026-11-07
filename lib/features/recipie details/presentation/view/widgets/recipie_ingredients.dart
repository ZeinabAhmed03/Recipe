import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_ingredients_model.dart';

class RecipieIngredients extends StatelessWidget {
  const RecipieIngredients({super.key, required this.mealDetails});
  final MealDetailsModel mealDetails;

  @override
  Widget build(BuildContext context) {
    List<MealIngredientsModel> ingredients = [];
    final meal = mealDetails.meals!.first.toJson();
    for (var i = 1; i <= 20; i++) {
      if (meal['strIngredient$i'] != null &&
          meal['strMeasure$i'] != null &&
          meal['strIngredient$i'] != "" &&
          meal['strMeasure$i'] != "") {
        final ingredient = meal['strIngredient$i'];
        final measure = meal['strMeasure$i'];
        MealIngredientsModel mealIngredients = MealIngredientsModel(
          ingredient: ingredient,
          quantity: measure,
        );
        ingredients.add(mealIngredients);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.all(8),
          shape: Border.all(style: BorderStyle.none),
          title: Text(
            'Ingredients',
            style: TextStyle(
              fontFamily: AppAssets.fontFamily,
              color: AppAssets.mainColor,
            ),
          ),
          children: [
            for (int i = 0; i < ingredients.length; i++)
              Card(
                color: AppColors.grey.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\u2022 ${ingredients[i].ingredient}'),
                      Text(ingredients[i].quantity),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
