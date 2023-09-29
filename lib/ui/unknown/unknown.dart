import 'package:flutter/material.dart';

import '../../colors.dart';

class UnknownRouteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          "assets/images/black logo.png",
          height: 100,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxHeight = constraints.maxHeight -
              (MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).padding.bottom);

          return Container(
            color: colorWhite,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  constraints: BoxConstraints(
                    minHeight: maxHeight,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: const Center(
                    child: Text(
                      "Unknown Route...",
                      style: TextStyle(color: colorBlack),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
