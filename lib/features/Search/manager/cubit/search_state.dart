part of 'search_cubit.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  final bool isFocused;

  const SearchInitial({this.isFocused = false});
}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final MealDetailsModel searchList;

  const SearchSuccess({required this.searchList});
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});
}
