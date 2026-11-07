part of 'meal_details_cubit.dart';

sealed class MealDetailsState extends Equatable {
  const MealDetailsState();

  @override
  List<Object> get props => [];
}

final class MealDetailsInitial extends MealDetailsState {}

final class MealDetailsLoading extends MealDetailsState {}

final class MealDetailsSuccess extends MealDetailsState {
  final MealDetailsModel mealDetails;

  const MealDetailsSuccess({required this.mealDetails});
}

final class MealDetailsFailure extends MealDetailsState {
  final String errMessage;

  const MealDetailsFailure({required this.errMessage});
}
