import 'package:exercises_apps/navigation/main_router.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, MainRouter.yesNoAppRoute);
                },
                child: const Text("Ir a YES NO APP")),
            FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, MainRouter.tokTikAppRoute);
                },
                child: const Text("Ir a TokTik")),
          ],
        ),
      ),
    );
  }
}
