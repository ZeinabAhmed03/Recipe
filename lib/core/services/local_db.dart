import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/core/models/meal.dart';

class LocalDb {
  static const favoritesBox = 'favorites';
  static const searchsBox = 'search';

  //------------------ Handle Favorites------------------------
  Future<void> toggleFavorite({required Meal meal}) async {
    if (Hive.box<Meal>(favoritesBox).containsKey(meal.idMeal)) {
      await Hive.box<Meal>(favoritesBox).delete(meal.idMeal);
    } else {
      await Hive.box<Meal>(favoritesBox).put(meal.idMeal, meal);
    }
  }

  bool checkIsInFavorites({required String mealId}) {
    return Hive.box<Meal>(favoritesBox).containsKey(mealId);
  }

  List<Meal> showStoredList() {
    return Hive.box<Meal>(favoritesBox).values.toList();
  }

  //------------------ Handle Search------------------------

  addToSearchHistory({required Meal meal}) async {
    if (!checkIfMealIsstored(mealId: meal.idMeal!)) {
      if (Hive.box<Meal>(searchsBox).values.toList().length < 5) {
        await Hive.box<Meal>(searchsBox).put(meal.idMeal, meal);
      } else {
        final oldestMeal = Hive.box<Meal>(searchsBox).keys.first;
        await Hive.box<Meal>(searchsBox).delete(oldestMeal);
        await Hive.box<Meal>(searchsBox).put(meal.idMeal, meal);
      }
    }
  }

  removeFromSearchHistory({required String mealId}) async {
    await Hive.box<Meal>(searchsBox).delete(mealId);
  }

  clearAllSearchHistory() async {
    await Hive.box<Meal>(searchsBox).clear();
  }

  bool checkIfMealIsstored({required String mealId}) {
    return Hive.box<Meal>(searchsBox).containsKey(mealId);
  }

  bool checkIfSearchBoxEmpty() {
    return Hive.box<Meal>(searchsBox).isNotEmpty;
  }

  int numberOfItemsInSearchBox() {
    return Hive.box<Meal>(searchsBox).length;
  }

  List<Meal> mealsInHistory() {
    return Hive.box<Meal>(searchsBox).values.toList();
  }
}
