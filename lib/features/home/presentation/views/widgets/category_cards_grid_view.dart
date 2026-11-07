import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/home/manager/categories%20cubit/get_all_categories_cubit.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/show_all_categories.dart';

class CategorieCardsGridView extends StatelessWidget {
  const CategorieCardsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return CustomLoadingIndicator();
        } else if (state is GetAllCategoriesSuccess) {
          return ShowAllCategories(
            categories: state.allCategoriesModel.categories!,
          );
        } else if (state is GetAllCategoriesFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(
            child: Text('There was a problem, please try again later'),
          );
        }
      },
    );
  }
}
