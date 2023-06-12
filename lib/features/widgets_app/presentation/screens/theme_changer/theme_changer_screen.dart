import 'package:exercises_apps/features/widgets_app/presentation/providers/theme_provider.dart';
import 'package:exercises_apps/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = "theme_changer_screen";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colorList = ref.watch(colorListProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final selectedIndexColor = ref.watch(themeNotifierProvider).selectedColor;

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Changer"), actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleMode();
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
      ],),
      body: ListView.builder(
          itemCount: colorList.length,
          itemBuilder: (context, index) {
            final color = colorList[index];
            return RadioListTile(
                value: index,
                groupValue: selectedIndexColor,
                activeColor: color,
                onChanged: (newValue) {
                  ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
                },
                title: Text("Este color", style: TextStyle(color: color)),
                subtitle: Text("${color.value}"));
          }),
    );
  }
}
