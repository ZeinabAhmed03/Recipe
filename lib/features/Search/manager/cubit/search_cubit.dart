import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/core/services/local_db.dart';
import 'package:recipeapp/features/Search/data/repos/search_repo.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo, this.localDb) : super(SearchInitial());
  final SearchRepo searchRepo;
  final LocalDb localDb;
  bool isMealSelected = false;

  CancelToken? _cancelToken;
  // ------------update focused state method----------------
  bool updateFocusState(bool focused) {
    emit(SearchInitial(isFocused: focused));
    log('is focused in cubit $focused');
    return focused;
  }

  //------------Reset Cubit Method---------------
  resetCubit() {
    _cancelToken?.cancel();
    emit(SearchInitial());
  }

  //-----------Search a Meal method--------------
  void searchMeal({required String mealName, CancelToken? cancelToken}) async {
    emit(SearchLoading());
    _cancelToken = cancelToken;
    final searchedMeal = await searchRepo.searchMeal(
      mealName: mealName,
      cancelToken: _cancelToken,
    );
    log(searchedMeal.toString());
    searchedMeal.fold((failure) {
      if (failure.errMessage == 'Request cancelled') {
        return;
      }
      emit(SearchFailure(errMessage: failure.errMessage));
    }, (success) => emit(SearchSuccess(searchList: success)));
  }

  // ---------------add a meal to search history method--------------
  addToSearchHistory({required Meal meal}) async {
    await localDb.addToSearchHistory(meal: meal);
    log(
      'is meal added to searchhistory: ${localDb.checkIfMealIsstored(mealId: meal.idMeal!)}',
    );
  }

  // -----------remove a meal from search history------------
  removeFromSearchHistory({required String mealId}) async {
    await localDb.removeFromSearchHistory(mealId: mealId);
    emit(SearchInitial(isFocused: true));

    log(
      'is meal removed from searchhistory: ${localDb.checkIfMealIsstored(mealId: mealId)}',
    );
  }

  // --------------------clear search history-------------
  clearAllSearchHistory() async {
    await localDb.clearAllSearchHistory();
    emit(SearchInitial(isFocused: true));
  }

  //----------Check if meak in stored in search histroy-----------------
  bool isMealInSearch({required String mealId}) {
    return localDb.checkIfMealIsstored(mealId: mealId);
  }

  //-----------get all stored meals-------------
  List<Meal> getHistoryStoredMeals() {
    return localDb.mealsInHistory();
  }
}
