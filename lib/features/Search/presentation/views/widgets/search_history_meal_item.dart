import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';

class SearchHistoryMealItem extends StatelessWidget {
  const SearchHistoryMealItem({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRoute.recipieDetailsView,
          extra: {
            'mealName': context
                .read<SearchCubit>()
                .getHistoryStoredMeals()[index]
                .strMeal,
            'mealId': context
                .read<SearchCubit>()
                .getHistoryStoredMeals()[index]
                .idMeal,
          },
        );
      },
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: context
              .read<SearchCubit>()
              .getHistoryStoredMeals()[index]
              .strMealThumb!,
          fit: BoxFit.fill,
          width: MediaQuery.sizeOf(context).width * 0.20,
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

        trailing: IconButton(
          onPressed: () async {
            await context.read<SearchCubit>().removeFromSearchHistory(
              mealId: context
                  .read<SearchCubit>()
                  .getHistoryStoredMeals()[index]
                  .idMeal!,
            );
          },
          icon: Icon(Icons.clear),
        ),
        title: Text(
          context.read<SearchCubit>().getHistoryStoredMeals()[index].strMeal!,
          style: TextStyle(
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            color: AppColors.white,
          ),
          maxLines: 1,
        ),
        subtitle: Text(
          context
              .read<SearchCubit>()
              .getHistoryStoredMeals()[index]
              .strCategory!,
          style: TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
            color: AppColors.grey,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
