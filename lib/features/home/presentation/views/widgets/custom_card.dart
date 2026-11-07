import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_colors.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.cardBody});
  final Widget cardBody;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 150,
          width: 150,

          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: AppColors.grey.shade50.withValues(alpha: 0.15),
          ),
          child: Center(child: cardBody),
        ),
      ],
    );
  }
}
