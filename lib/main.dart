import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'colors.dart';
import 'providers/endpoint_provider.dart';
// import 'ui/body/main_screen.dart';
import 'ui/components.dart';
import 'ui/view/view_list.dart';
import 'widgets/login/login_body.dart';
import 'providers/user_provider.dart';
import 'ui/home/home.dart';
import 'ui/login/login_compact_view.dart';
import 'ui/login/login_full_view.dart';
import 'ui/unknown/unknown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const welcomeImage = './assets/images/welcome.jpg';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<EndpointProvider>(
            create: (_) => EndpointProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EffiCura',
        theme: ThemeData.dark().copyWith(
          // useMaterial3: true,
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: colorWhite),
          canvasColor: secondaryColor,
        ),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => UnknownRouteContainer(),
          );
        },
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => LoginBody(
                compact: CompactView(
                  welcomeImage: welcomeImage,
                  formKey: _formKey,
                ),
                full: FullView(
                  welcomeImage: welcomeImage,
                  formKey: _formKey,
                ),
              ),
          "/home": (BuildContext context) => Home(),
          "/components": (BuildContext context) => const Components(),
          "/view_list": (BuildContext context) => MyTable(),
        },
      ),
    );
  }
}
