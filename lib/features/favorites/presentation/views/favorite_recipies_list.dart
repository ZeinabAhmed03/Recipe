import 'package:flutter/material.dart';
import 'package:recipeapp/features/favorites/presentation/views/widgets/favorite_recipies_list_view_body.dart';

class FavoriteRecipiesListView extends StatelessWidget {
  const FavoriteRecipiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const FavoriteRecipiesListViewBody());
  }
}
