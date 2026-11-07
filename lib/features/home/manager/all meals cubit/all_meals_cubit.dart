import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipeapp/features/home/data/models/all_meals_model/all_meals_model.dart';
import 'package:recipeapp/features/home/data/repos/all%20meals%20repo/get_all_meals_repo.dart';

part 'all_meals_state.dart';

class AllMealsCubit extends Cubit<AllMealsState> {
  AllMealsCubit(this.getAllMealsRepo) : super(AllMealsInitial());
  final GetAllMealsRepo getAllMealsRepo;

  void getAllMeals({required String category}) async {
    emit(AllMealsLoading());

    final response = await getAllMealsRepo.getallMeals(category: category);

    response.fold(
      (failure) => emit(AllMealsFailure(errMessage: failure.errMessage)),
      (success) => emit(AllMealsSuccess(allMeals: success)),
    );
  }
}
