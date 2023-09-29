import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final Widget full;
  final Widget compact;

  const LoginBody({
    required this.full,
    required this.compact,
    super.key,
  });

  factory LoginBody.single({required Widget body}) {
    return LoginBody(full: body, compact: body);
  }

  factory LoginBody.multi({
    required Widget full,
    required Widget compact,
  }) {
    return LoginBody(full: full, compact: compact);
  }

  @override
  Widget build(Object context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
        return Scaffold(
          body: compact,
        );
      } else {
        return Scaffold(
          body: full,
        );
      }
    });
  }
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}
