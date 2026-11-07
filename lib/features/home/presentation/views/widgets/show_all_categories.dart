import 'package:flutter/material.dart';
import 'package:recipeapp/features/home/data/models/all_categories_model/category.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/category_item.dart';

class ShowAllCategories extends StatelessWidget {
  const ShowAllCategories({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .9,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CategoryItem(categories: categories, index: index),
      ),
    );
  }
}
