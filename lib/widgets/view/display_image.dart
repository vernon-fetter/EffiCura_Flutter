import 'package:flutter/material.dart';
import '../../colors.dart';

class DisplayImageControl extends StatelessWidget {
  final String imageUrl;
  final Function onTap;

  const DisplayImageControl({
    Key? key,
    required this.imageUrl,
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
          color: colorButton, // You can change this color to fit your design
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: colorGreen, // You can change this color as needed
              blurRadius: 3,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 130,
            height: 50,
          ),
        ),
      ),
    );
  }
}
