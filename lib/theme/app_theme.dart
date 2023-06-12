import 'package:flutter/material.dart';

const Color customColor = Color(0xFF49149F);

const List<Color> colorThemes = [
  customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor <= colorThemes.length - 1,
            'Colors must be between 0 and ${colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorThemes[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ));
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) {
    return AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode, selectedColor: selectedColor ?? this.selectedColor);
  }
}
