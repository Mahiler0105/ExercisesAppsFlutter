import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Botones')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => context.pop()),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit),
              label: const Text('Elevated Icon')),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("Filled Icon")),
          FilledButton.tonal(
              onPressed: () {}, child: const Text("Filled Tonal")),
          FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("Filled Tonal Icon")),
          OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("Outlined Icon")),
          TextButton(onPressed: () {}, child: const Text("Text")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("Text Icon")),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.ac_unit_outlined)),
          const _CustomButton(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ))
        ]),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius:  BorderRadius.circular(20),
        child: Material(
          color: colors.primary,
          child: InkWell(
               onTap: () {},
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child:
                      Text('Hola mundo', style: TextStyle(color: Colors.white)))),
        ),
      ),
    );
  }
}
