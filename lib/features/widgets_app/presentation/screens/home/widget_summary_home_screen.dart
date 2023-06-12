import 'package:exercises_apps/features/widgets_app/config/menu/menu_items.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/app_tutorial/app_tutorial_screen.dart';
import 'package:exercises_apps/main/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/site_menu.dart';

class WidgetSummaryHomeScreen extends StatefulWidget{
  static const String name = "widget_summary_home_screen";

  const WidgetSummaryHomeScreen({super.key});

  @override
  State<WidgetSummaryHomeScreen> createState() => _WidgetSummaryHomeScreenState();
}

class _WidgetSummaryHomeScreenState extends State<WidgetSummaryHomeScreen> {

  Future<void> preloadImages() async {
    for (final slide in slides) {
      await precacheImage(AssetImage(slide.imageUrl), context);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    preloadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets App"),
        // automaticallyImplyLeading: false
      ),
      body: const _HomeView(),
      drawer: const SideMenu(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.pop();
      }, child: const Icon(Icons.arrow_back_ios_outlined)),
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
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final bodyStyle = Theme.of(context).textTheme.bodySmall;

    return ListTile(
      title: Text(menuItem.title, style: titleStyle),
      subtitle: Text(menuItem.subTitle, style: bodyStyle),
      leading: Icon(menuItem.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
      onTap: () => context.pushNamed(menuItem.link),
    );
  }
}
