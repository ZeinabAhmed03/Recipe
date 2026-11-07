import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/features/recipie%20details/presentation/view/widgets/recipie_details_view_body.dart';

class RecipieDetailsView extends StatelessWidget {
  const RecipieDetailsView({super.key, required this.mealName});
  final String mealName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealName,
          style: TextStyle(fontFamily: AppAssets.fontFamily),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: GoRouter.of(context).pop,
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: RecipieDetailsViewBody(),
    );
  }
}
