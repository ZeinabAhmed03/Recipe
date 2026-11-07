import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/recipie%20details/manager/meal%20details%20cubit/meal_details_cubit.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_actions.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_ingredients.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_instructions.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_source_link.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_youtube_card.dart';

class RecipieDetailsViewBody extends StatelessWidget {
  const RecipieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MealDetailsCubit, MealDetailsState>(
        builder: (context, state) {
          if (state is MealDetailsLoading) {
            return CustomLoadingIndicator();
          } else if (state is MealDetailsSuccess) {
            final mealSource = state.mealDetails.meals?.first.strSource;

            return SingleChildScrollView(
              child: Column(
                children: [
                  RecipieYoutubeCard(meal: state.mealDetails),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Icon(Icons.language, color: AppColors.grey),
                          Text(
                            state.mealDetails.meals!.first.strCountry!,
                            style: TextStyle(color: AppColors.grey),
                          ),
                        ],
                      ),
                      RecipieActions(
                        mealDetails: state.mealDetails.meals!.first,
                      ),
                    ],
                  ),
                  RecipieInstructions(
                    instructions:
                        state.mealDetails.meals!.first.strInstructions!,
                  ),

                  RecipieIngredients(mealDetails: state.mealDetails),

                  mealSource != null &&
                          mealSource.trim().isNotEmpty &&
                          mealSource.toLowerCase() != 'null'
                      ? RecipieSourceLink(sourceLink: mealSource)
                      : SizedBox(),
                ],
              ),
            );
          } else if (state is MealDetailsFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(
              child: Text('There was a problem, please try again later'),
            );
          }
        },
      ),
    );
  }
}
