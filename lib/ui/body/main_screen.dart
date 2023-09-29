import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/drawer_controller.dart';
import '../../models/home/menu_items_model.dart';
import '../../services/home/get/get_menu_items.dart';
import '../../widgets/body/drawer.dart';
import '../../widgets/home/responsive_body.dart';
import '../home/home.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<MenuItems> menuItems;

  @override
  void initState() {
    super.initState();
    menuItems = getMenuItems(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<DrawerMenuController>().scaffoldKey,
      drawer: DrawerControl(
        menuItems: menuItems,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (ResponsiveBody.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: DrawerControl(
                  menuItems: menuItems,
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Home(),
            ),
          ],
        ),
      ),
    );
  }
}
