import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/home/data/models/all_categories_model/category.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/custom_card.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categories,
    required this.index,
  });

  final List<Category> categories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(
        context,
      ).push(AppRoute.recipiesListView, extra: categories[index].strCategory),
      child: Column(
        children: [
          CustomImageCard(
            cardBody: CachedNetworkImage(
              imageUrl: categories[index].strCategoryThumb!,
              placeholder: (context, url) => Container(
                color: AppColors.grey.shade50.withValues(alpha: 0.15),
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CustomLoadingIndicator(),
                  ),
                ),
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            categories[index].strCategory!,
            style: TextStyle(
              fontFamily: AppAssets.fontFamily,
              color: AppAssets.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
