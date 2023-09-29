import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'login_form.dart';

class FullView extends StatefulWidget {
  const FullView({
    Key? key,
    required this.welcomeImage,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String welcomeImage;
  final GlobalKey<FormState> _formKey;

  @override
  State<FullView> createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        return Row(
          children: [
            Flexible(
              child: LoginForm(
                formKey: widget._formKey,
              ),
            ),
            Flexible(
              child: HeroImage(
                welcomeImage: widget.welcomeImage,
              ),
            ),
          ],
        );
      },
    );
  }
}
