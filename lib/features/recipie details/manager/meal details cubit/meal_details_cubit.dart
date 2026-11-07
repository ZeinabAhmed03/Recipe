import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';
import 'package:recipeapp/features/recipie%20details/data/repos/meal%20details/meal_deails_repo.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit(this.mealDetailsRepo) : super(MealDetailsInitial());

  final MealDetailsRepo mealDetailsRepo;
  mealDeails({required String mealId}) async {
    emit(MealDetailsLoading());

    final response = await mealDetailsRepo.getmealDetails(mealId: mealId);

    response.fold(
      (failure) => emit(MealDetailsFailure(errMessage: failure.errMessage)),
      (success) => emit(MealDetailsSuccess(mealDetails: success)),
    );
  }
}
