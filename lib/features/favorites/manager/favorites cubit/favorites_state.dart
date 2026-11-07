part of 'favorites_cubit.dart';

sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesUpdated extends FavoritesState {
  final List<Meal> favMeals;

  FavoritesUpdated({required this.favMeals});
}
