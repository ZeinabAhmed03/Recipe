import 'package:flutter/material.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/meal_item.dart';

class ShowAllMeals extends StatelessWidget {
  const ShowAllMeals({super.key, required this.meals});
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meals.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .9,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: MealItem(meals: meals, index: index),
      ),
    );
  }
}
