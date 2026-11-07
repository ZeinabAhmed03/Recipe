import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:recipeapp/core/utils/app_colors.dart';
import 'package:recipeapp/core/widgets/custom_local_indicator.dart';
import 'package:recipeapp/features/recipie%20details/data/models/meal_details_model/meal_details_model.dart';

class RecipieYoutubeCard extends StatefulWidget {
  const RecipieYoutubeCard({super.key, required this.meal});
  final MealDetailsModel meal;

  @override
  State<RecipieYoutubeCard> createState() => _RecipieYoutubeCardState();
}

class _RecipieYoutubeCardState extends State<RecipieYoutubeCard> {
  bool isPlayed = false;
  late String videoUrl;
  @override
  void initState() {
    super.initState();
    final String url = widget.meal.meals?.first.strYoutube ?? '';
    if (url.toLowerCase() != 'null' && url.trim().isNotEmpty) {
      videoUrl = url;
    } else {
      videoUrl = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1 / 3,
      width: double.infinity,
      child: isPlayed == false
          ? videoUrl.isNotEmpty
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.red),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.meal.meals!.first.strMealThumb!,
                          placeholder: (context, url) => Container(
                            color: AppColors.grey.shade50.withValues(
                              alpha: 0.15,
                            ),
                            child: const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CustomLoadingIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          isPlayed = true;
                          setState(() {});
                        },
                        icon: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: AppColors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  )
                : Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: AppColors.grey),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.meal.meals!.first.strMealThumb!,
                      placeholder: (context, url) => Container(
                        color: AppColors.grey.shade50.withValues(alpha: 0.15),
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CustomLoadingIndicator(),
                          ),
                        ),
                      ),
                    ),
                  )
          : InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(videoUrl)),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
    );
  }
}
