import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'login_form.dart';

class CompactView extends StatefulWidget {
  const CompactView({
    Key? key,
    required this.welcomeImage,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String welcomeImage;
  final GlobalKey<FormState> _formKey;

  @override
  State<CompactView> createState() => _CompactViewState();
}

class _CompactViewState extends State<CompactView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: HeroImage(welcomeImage: widget.welcomeImage),
            ),
            LoginForm(formKey: widget._formKey),
          ],
        ),
      );
    });
  }
}

