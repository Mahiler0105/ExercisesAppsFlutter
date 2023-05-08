import 'package:exercises_apps/main/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class MainScreen extends StatefulWidget {
  static const String name = "main_screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAlert(context),
        child: const Icon(Icons.family_restroom),
      ),
      body: ListView.builder(itemCount: appMainMenuItems.length, itemBuilder: (context, index) {
        final appMainMenuItem = appMainMenuItems[index];
        return Column(
          children: [
            ListTile(
              title: Text(appMainMenuItem.title),
              subtitle: Text(appMainMenuItem.subTitle),
              leading: Icon(appMainMenuItem.icon),
              onTap: () =>  context.pushNamed(appMainMenuItem.link),
            ),
            const Divider(),
          ],
        );
      } ),
    );
  }

  void _showAlert(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SizedBox(height: 175, width: size.width, child: PhotoView(imageProvider: const AssetImage("assets/agu.png"))),
          );
        });
  }
}
