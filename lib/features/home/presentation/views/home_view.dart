import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/features/Search/manager/cubit/search_cubit.dart';
import 'package:recipeapp/features/Search/presentation/views/search_view.dart';
import 'package:recipeapp/features/favorites/presentation/views/favorite_recipies_list.dart';
import 'package:recipeapp/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final _pages = const [
    Center(child: HomeViewBody()),
    Center(child: SearchView()),
    Center(child: FavoriteRecipiesListView()),
  ];
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: LiquidGlassBottomBar(
        activeColor: AppAssets.mainColor,
        items: [
          LiquidGlassBottomBarItem(icon: CupertinoIcons.home, label: 'Home'),
          LiquidGlassBottomBarItem(
            icon: CupertinoIcons.search,
            label: 'Search',
          ),
          LiquidGlassBottomBarItem(
            icon: CupertinoIcons.heart,
            label: 'Favorites',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          if (value != 1) {
            context.read<SearchCubit>().updateFocusState(false);
            context.read<SearchCubit>().resetCubit();
          }
        },
      ),

      body: IndexedStack(index: _currentIndex, children: _pages),
    );
  }
}
