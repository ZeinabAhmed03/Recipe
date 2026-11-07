import 'package:bloc/bloc.dart';
import 'package:recipeapp/core/services/local_db.dart';
import 'package:recipeapp/core/models/meal.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.localDb) : super(FavoritesInitial()) {
    emit(FavoritesUpdated(favMeals: getFavoriteList()));
  }

  final LocalDb localDb;

  Future toggleFavorite({required Meal meal}) async {
    await localDb.toggleFavorite(meal: meal);

    emit(FavoritesUpdated(favMeals: getFavoriteList()));
  }

  bool isInFavorite({required Meal meal}) {
    return localDb.checkIsInFavorites(mealId: meal.idMeal!);
  }

  List<Meal> getFavoriteList() {
    final List<Meal> storedMeals = localDb.showStoredList();

    return storedMeals;
  }
}
