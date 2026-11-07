import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipeapp/features/Search/presentation/views/widgets/search_result.dart';
import 'package:recipeapp/features/Search/presentation/views/widgets/search_text_feild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80, width: double.infinity, child: SearchTextField()),
        SearchResult(),
      ],
    );
  }
}
