import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLoader extends StatelessWidget {
  final bool isBusy;
  final EdgeInsets? padding;

  const AnimatedLoader({
    super.key,
    required this.isBusy,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? Container(
            padding: const EdgeInsets.fromLTRB(
              0,
              50,
              0,
              0,
            ),
            child: Center(
              child: Lottie.asset(
                'assets/json/.json',
              ),
            ),
          )
        : Container();
  }
}
