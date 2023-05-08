import 'package:exercises_apps/navigation/main_router.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () => Navigator.pushNamed(context, MainRouter.yesNoAppRoute),
                child: const Text("Ir a YES NO APP")),
            FilledButton(
                onPressed: () => Navigator.pushNamed(context, MainRouter.tokTikAppRoute),
                child: const Text("Ir a TokTik")),
            FilledButton(
                onPressed: () => _showAlert(context),
                child: const Text("Aguuuuu papá/mamá")),
          ],
        ),
      ),
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
