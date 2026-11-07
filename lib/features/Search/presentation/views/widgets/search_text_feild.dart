import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _textController;
  Timer? _debounce;
  CancelToken? _cancelToken;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  void _onSearchChange(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    _debounce = Timer(const Duration(seconds: 1), () {
      context.read<SearchCubit>().searchMeal(
        mealName: query,
        cancelToken: _cancelToken,
      );
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _debounce?.cancel();
    _cancelToken?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchInitial && !state.isFocused) {
          _textController.clear();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          onTap: () {
            if (context.read<SearchCubit>().state is! SearchSuccess) {
              context.read<SearchCubit>().updateFocusState(true);
            }
          },

          onChanged: (value) {
            log(value);

            if (value.isEmpty) {
              if (_debounce?.isActive ?? false) {
                _debounce!.cancel();
              }
              _cancelToken?.cancel();

              context.read<SearchCubit>().updateFocusState(true);
            } else {
              _onSearchChange(value);
            }
          },

          cursorColor: AppColors.white,
          decoration: InputDecoration(
            hint: Text(
              'Search a Meal',
              style: TextStyle(
                color: AppColors.grey,
                fontFamily: AppAssets.fontFamily,
              ),
            ),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: AppColors.grey,
              size: 22,
            ),

            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            errorBorder: outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.white),
    );
  }
}
