import 'package:flutter/cupertino.dart';
import 'package:recipeapp/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColors.mainAppColor,
        radius: 24,
      ),
    );
  }
}
