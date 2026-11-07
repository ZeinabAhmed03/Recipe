import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';
import 'package:recipeapp/features/Search/presentation/views/widgets/search_history_meal_item.dart';

class ShowSearchHistoryMeals extends StatelessWidget {
  const ShowSearchHistoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                onPressed: () {
                  context.read<SearchCubit>().clearAllSearchHistory();
                },
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mainAppColor.shade100,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: context
                .read<SearchCubit>()
                .getHistoryStoredMeals()
                .length,
            itemBuilder: (BuildContext context, int index) {
              return SearchHistoryMealItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}
