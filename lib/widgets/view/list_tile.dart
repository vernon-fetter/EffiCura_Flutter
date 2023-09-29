import 'package:flutter/material.dart';
import '../../colors.dart';
import 'display_image.dart';

class ListTileControl extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? thumbnailUrl;
  final Function onTap;

  const ListTileControl({
    Key? key,
    required this.title,
    required this.subtitle,
    this.thumbnailUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 5.0;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: colorGreen,
              blurRadius: 3,
            )
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (thumbnailUrl != null)
              DisplayImageControl(
                imageUrl: thumbnailUrl!,
                onTap: () {}, // Add the onTap behavior for the thumbnail if needed
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward, // You can change this to a different icon as needed
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
