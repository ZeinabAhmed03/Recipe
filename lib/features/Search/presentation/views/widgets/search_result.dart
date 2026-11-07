import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/services/local_db.dart';
import 'package:recipeapp/core/services/service_locator.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';
import 'package:recipeapp/features/Search/presentation/views/widgets/show_search_history_meals.dart';
import 'package:recipeapp/features/Search/presentation/views/widgets/show_searched_meals_list.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          log('current State of Search is $state');

          if (state is SearchInitial && state.isFocused == true) {
            log('and value of is focused is ${state.isFocused}');
            return (getIt<LocalDb>().checkIfSearchBoxEmpty())
                ? ShowSearchHistoryMeals()
                : SizedBox();
          }
          if (state is SearchLoading) {
            return CustomLoadingIndicator();
          } else if (state is SearchSuccess) {
            if (state.searchList.meals == null ||
                state.searchList.meals!.isEmpty) {
              return const Center(child: Text('No meals found'));
            } else {
              return ShowSearchedMealsList(meals: state.searchList.meals!);
            }
          } else if (state is SearchFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
