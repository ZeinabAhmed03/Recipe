import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/category_cards_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Select a Category...',
            style: TextStyle(
              fontSize: 18,
              fontFamily: AppAssets.fontFamily,
              color: AppAssets.mainColor,
            ),
          ),
        ),
        Expanded(child: CategorieCardsGridView()),
      ],
    );
  }
}
