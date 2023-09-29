import 'package:flutter/material.dart';

import '../../colors.dart';

enum ButtonControlType {
  primary,
  link,
}

class ButtonControl extends StatelessWidget {
  final String title;
  final Function onTap;
  final ButtonControlType type;
  final bool isBusy;

  const ButtonControl({
    Key? key,
    required this.title,
    required this.onTap,
    required this.type,
    required this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 5.0;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 130, minHeight: 50),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: secondaryColor,
                blurRadius: 3,
              )
            ],
          ),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: isBusy
              ? const Center(
                  child:  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                )
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorWhite,
                  ),
                ),
        ),
      ),
    );
  }
}
