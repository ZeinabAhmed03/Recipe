import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/services/local_db.dart';
import 'package:recipeapp/core/services/service_locator.dart';
import 'package:recipeapp/core/services/simple_bloc_observer.dart';
import 'package:recipeapp/features/Search/data/repos/search_repo.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';
import 'package:recipeapp/core/models/meal.dart';
import 'package:recipeapp/features/favorites/manager/favorites%20cubit/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MealAdapter());
  await Hive.openBox<Meal>(LocalDb.favoritesBox);
  await Hive.openBox<Meal>(LocalDb.searchsBox);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit(getIt<LocalDb>())),
        BlocProvider(
          create: (context) =>
              SearchCubit(getIt<SearchRepo>(), getIt<LocalDb>()),
        ),
      ],
      child: SafeArea(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),

          routerConfig: AppRoute.goRouter,
        ),
      ),
    );
  }
}
