import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/features/favorites/manager/favorites%20cubit/favorites_cubit.dart';
import 'package:share_plus/share_plus.dart';

class RecipieActions extends StatefulWidget {
  const RecipieActions({super.key, required this.mealDetails});
  final Meal mealDetails;

  @override
  State<RecipieActions> createState() => _RecipieActionsState();
}

class _RecipieActionsState extends State<RecipieActions> {
  late bool isInfavorite;
  late Meal meal;
  late FavoritesCubit favoritesCubit;
  @override
  void initState() {
    super.initState();
    meal = widget.mealDetails;

    favoritesCubit = context.read<FavoritesCubit>();
    isInfavorite = favoritesCubit.isInFavorite(meal: meal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesUpdated) {
              isInfavorite = context.read<FavoritesCubit>().isInFavorite(
                meal: meal,
              );
              Future.delayed(Duration(milliseconds: 3), () {
                log('delayed is infavorite value: $isInfavorite');
              });
            }
            return IconButton(
              onPressed: () async {
                await favoritesCubit.toggleFavorite(meal: meal);

                Future.delayed(Duration(milliseconds: 3), () {
                  log('is in favorite : $isInfavorite');
                });
              },
              icon: isInfavorite
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_outline, color: AppColors.grey),
              padding: EdgeInsets.zero,
            );
          },
        ),
        IconButton(
          onPressed: () async {
            final shareText = _shareRecipie();

            await SharePlus.instance.share(ShareParams(text: shareText));
          },
          icon: Icon(Icons.share, color: AppColors.grey),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }

  String _shareRecipie() {
    final List<String> ingredients = [];
    final meal = widget.mealDetails.toJson();
    for (var i = 1; i <= 20; i++) {
      if (meal['strIngredient$i'] != null &&
          meal['strIngredient$i'] != "" &&
          meal['strMeasure$i'] != null &&
          meal['strMeasure$i'] != "") {
        final ingredient = meal['strIngredient$i'];
        final measure = meal['strMeasure$i'];
        ingredients.add('- $ingredient: $measure');
      }
    }
    return 'Check out this recipie: ${widget.mealDetails.strMeal}\n\n'
        'Country: ${widget.mealDetails.strCountry}\n\n'
        '${widget.mealDetails.strMealThumb}\n\n'
        'Instructions:\n ${widget.mealDetails.strInstructions}\n\n'
        'ingredients and measurements:\n ${ingredients.join('\n')} \n\n'
        'check youtube video:\n ${widget.mealDetails.strYoutube ?? 'Video is not available for this recipie'} \n\n'
        'check youtube video:\n ${widget.mealDetails.strSource ?? 'source is not available for this recipie'} \n\n';
  }
}
