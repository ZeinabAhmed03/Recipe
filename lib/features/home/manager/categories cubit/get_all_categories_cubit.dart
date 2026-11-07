import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipeapp/features/home/data/models/all_categories_model/all_categories_model.dart';
import 'package:recipeapp/features/home/data/repos/all%20categories%20repo/get_all_categories_repo.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.getCuisineRepo) : super(GetAllCategoriesInitial());
  final GetAllCategoriesRepo getCuisineRepo;
  void getAllCuisines() async {
    emit(GetAllCategoriesLoading());

    final response = await getCuisineRepo.getAllCategories();
    log(response.toString());
    response.fold(
      (failure) =>
          emit(GetAllCategoriesFailure(errMessage: failure.errMessage)),
      (success) => emit(GetAllCategoriesSuccess(allCategoriesModel: success)),
    );
  }
}
