import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/home/manager/all%20meals%20cubit/all_meals_cubit.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/show_all_meals.dart';

class RecipieCard extends StatelessWidget {
  const RecipieCard({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMealsCubit, AllMealsState>(
      builder: (context, state) {
        if (state is AllMealsLoading) {
          return CustomLoadingIndicator();
        } else if (state is AllMealsSuccess) {
          return ShowAllMeals(meals: state.allMeals.meals!);
        } else if (state is AllMealsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(
            child: Text('There was aproblem, please try again later'),
          );
        }
      },
    );
  }
}
