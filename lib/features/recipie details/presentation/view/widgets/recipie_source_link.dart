import 'package:flutter/material.dart';
import 'package:recipeapp/core/utils/app_assets.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipieSourceLink extends StatelessWidget {
  const RecipieSourceLink({super.key, required this.sourceLink});
  final String sourceLink;
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(sourceLink);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Check Recipie Source',
          style: TextStyle(
            fontFamily: AppAssets.fontFamily,
            color: AppAssets.mainColor,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text('Could not launch this link: $url'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            }
          },
          icon: Icon(Icons.open_in_new),
        ),
      ],
    );
  }
}
