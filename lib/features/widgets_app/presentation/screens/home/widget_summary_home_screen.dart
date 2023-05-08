import 'package:exercises_apps/features/widgets_app/config/menu/menu_items.dart';
import 'package:exercises_apps/main/menu_item.dart';
import 'package:flutter/material.dart';

class WidgetSummaryHomeScreen extends StatelessWidget{
  static const String name = "widget_summary_home_screen";

  const WidgetSummaryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets App"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: appWidgetMenuItems.length, itemBuilder: (context, index) {
      final menuItem = appWidgetMenuItems[index];
      return _CustomListTile(menuItem: menuItem);
    });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
    );
  }
}
