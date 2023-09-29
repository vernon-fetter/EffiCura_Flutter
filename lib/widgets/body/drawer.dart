import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../font_awesome_icon_map.dart';
import '../../models/home/menu_items_model.dart';
import '../../providers/endpoint_provider.dart';

String extractKeyword(String input) {
  RegExp regex = RegExp(r'\/(\w+)modelview\/list\/');
  RegExpMatch? match = regex.firstMatch(input);
  
  if (match != null) {
    return match.group(1) ?? "Unknown"; // Use the null-aware operator to provide a default value
  }
  
  // Return a default value or handle the case when no match is found
  return "Unknown";
}

class DrawerControl extends StatefulWidget {
  final Future<MenuItems> menuItems;
  const DrawerControl({required this.menuItems, super.key});

  @override
  State<DrawerControl> createState() => _DrawerControlState();
}

class _DrawerControlState extends State<DrawerControl> {
  String keyword = "";

  Widget _buildMenuList(List<dynamic> menuItems) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = menuItems[index];

        if (menuItem is Result) {
          if (menuItem.childs != null && menuItem.childs!.isNotEmpty) {
            return ExpansionTile(
              title: Row(
                children: [
                  FaIcon(
                    // Use the icon mapping to get the IconData
                    iconDataMap[menuItem.icon ?? ""] ??
                        FontAwesomeIcons
                            .circle, // Use a default icon if not found
                  ),
                  const SizedBox(width: 16),
                  Text(menuItem.label!),
                ],
              ),
              children: [
                _buildMenuList(menuItem.childs!),
              ],
            );
          } else {
            return ListTile(
              leading: FaIcon(
                iconDataMap[menuItem.icon ?? ""] ?? FontAwesomeIcons.circle,
              ),
              title: Text(menuItem.label!),
              // Add your onTap logic here for handling menu item selection
            );
          }
        } else if (menuItem == "-") {
          return const Divider();
        } else if (menuItem is Map<String, dynamic>) {
          final result = Result.fromJson(menuItem);
          return ListTile(
            leading: FaIcon(
              iconDataMap[result.icon ?? ""] ?? FontAwesomeIcons.circle,
            ),
            title: Text(result.label! + " - Endpoint:" + result.url!),
            onTap: () {
              // Add your onTap logic here for handling menu item selection
              keyword = extractKeyword(result.url!);
              Provider.of<EndpointProvider>(context, listen: false).endpoint =
                  keyword;
              Navigator.of(context).pushReplacementNamed('/view_list');
            },
          );
        } else {
          return const ListTile(
            title: Text('Invalid menu item'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<MenuItems>(
        future: widget.menuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.result!.isEmpty) {
            return const Center(
              child: Text('No menu items available.'),
            );
          } else {
            final menuItems = snapshot.data!.result!;
            return _buildMenuList(menuItems);
          }
        },
      ),
    );
  }
}
