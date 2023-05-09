import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = "snackbar_screen";

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SnackBars y Diálogos")),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showSnackbar(context);
          },
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: () {
              showAboutDialog(context: context);
            }, child: const Text("Licencias usadas")),
            FilledButton.tonal(onPressed: () {
              _showDialog(context);
            }, child: const Text("Mostrar dialogo")),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
     showDialog(context: context, barrierDismissible: false, builder: (context) {
      return AlertDialog(
        title: const Text("Estas seguró?"),
        content: const Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
        actions: [
          TextButton(onPressed: (){ context.pop(); }, child: Text("Si")),
          FilledButton(onPressed: () { context.pop(); }, child: Text("Salir"))
        ],
      );
    });
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackbar = SnackBar(content: Text('Hola mundo'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
