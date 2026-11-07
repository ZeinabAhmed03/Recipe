import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/recipie_card.dart';

class RecipiesList extends StatelessWidget {
  const RecipiesList({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontFamily: AppAssets.fontFamily,
            color: AppColors.mainAppColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.mainAppColor),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [Expanded(child: RecipieCard())]),
    );
  }
}
