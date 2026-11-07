import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';

class RecipieInstructions extends StatelessWidget {
  const RecipieInstructions({super.key, required this.instructions});
  final String instructions;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(
          'Instructions: ',
          style: TextStyle(
            fontFamily: AppAssets.fontFamily,
            color: AppAssets.mainColor,
          ),
        ),
        ReadMoreText(
          instructions,
          style: TextStyle(color: AppColors.white),
          lessStyle: TextStyle(color: Colors.amber.shade200),
          moreStyle: TextStyle(color: Colors.amber.shade200),
        ),
      ],
    );
  }
}
