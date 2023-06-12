import 'package:exercises_apps/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorListProvider = Provider((ref) => colorThemes);
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme>{
  ThemeNotifier(): super(AppTheme());

  void toggleMode (){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index){
    state = state.copyWith(selectedColor: index);
  }
}
