import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/core/routing/app_route.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:recipeapp/core/utils/app_colors.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      indicatorPosition: 150,
      headerBackgroundColor: AppAssets.mainColor,
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: AppAssets.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
      ),
      controllerColor: AppAssets.mainColor,
      finishButtonText: 'Start',
      skipTextButton: Text(
        'Skip',
        style: TextStyle(color: AppAssets.mainColor, fontSize: 18),
      ),
      centerBackground: true,
      skipIcon: Icon(Icons.arrow_forward_ios, color: AppColors.white),

      background: [
        SizedBox(
          height: 500,
          child: Image.asset(AppAssets.onboardingImage1, fit: BoxFit.fill),
        ),
        SizedBox(
          height: 500,
          child: Image.asset(AppAssets.onboardingImage2, fit: BoxFit.cover),
        ),
        SizedBox(
          height: 500,
          child: Image.asset(AppAssets.onboardingImage3, fit: BoxFit.fill),
        ),
      ],
      speed: 2,
      pageBodies: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(flex: 12),
            ListTile(
              title: Text(
                'Discover Delicious Recipes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppAssets.mainColor,
                  fontSize: 18,
                  fontFamily: AppAssets.fontFamily,
                ),
              ),
              subtitle: Text(
                'Explore thousands of global and local dishes to spark your daily cooking inspiration.',
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
        Column(
          children: [
            Spacer(flex: 12),
            ListTile(
              title: Text(
                'Smart Ingredients & Favorites',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppAssets.mainColor,
                  fontSize: 18,
                  fontFamily: AppAssets.fontFamily,
                ),
              ),
              subtitle: Text(
                'View clean, organized ingredient lists and save your go-to meals in your private collection.',
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
        Column(
          children: [
            Spacer(flex: 12),
            ListTile(
              title: Text(
                'Cook with Confidence',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppAssets.mainColor,
                  fontSize: 18,
                  fontFamily: AppAssets.fontFamily,
                ),
              ),
              subtitle: Text(
                'Follow simple step-by-step instructions and prepare amazing meals with ease.',
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ],
      onFinish: () => GoRouter.of(context).pushReplacement(AppRoute.homeView),
    );
  }
}
