part of 'all_meals_cubit.dart';

sealed class AllMealsState extends Equatable {
  const AllMealsState();

  @override
  List<Object> get props => [];
}

final class AllMealsInitial extends AllMealsState {}

final class AllMealsLoading extends AllMealsState {}

final class AllMealsSuccess extends AllMealsState {
  final AllMealsModel allMeals;

  const AllMealsSuccess({required this.allMeals});
}

final class AllMealsFailure extends AllMealsState {
  final String errMessage;

  const AllMealsFailure({required this.errMessage});
}
