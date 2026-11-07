import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      duration: Duration(seconds: 5),
      animationCurve: Curves.easeInOut,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.food_bank, size: 160, color: AppAssets.mainColor),
          Text(
            'Your Recipie',
            style: TextStyle(
              fontFamily: AppAssets.fontFamily,
              color: AppAssets.mainColor,
            ),
          ),
        ],
      ),
      onEnd: () =>
          GoRouter.of(context).pushReplacement(AppRoute.onboardingView),
    );
  }
}
