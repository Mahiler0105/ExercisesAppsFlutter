import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        selectedIndex: _navDrawerIndex,
        onDestinationSelected: (index) {
          context.pushNamed(appWidgetMenuItems[index].link);
          Scaffold.of(context).closeDrawer();

          setState(() {
            _navDrawerIndex = index;
          });
        },
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
            child: Text("Menu"),
          ),
          ...appWidgetMenuItems
              .sublist(0, 3)
              .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title)))
              .toList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text("More options"),
          ),
          ...appWidgetMenuItems
              .sublist(3)
              .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title)))
              .toList(),
        ]);
  }
}
