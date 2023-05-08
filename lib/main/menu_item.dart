import 'package:exercises_apps/features/tok_tik/presentation/screens/tok_tik_screen.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/home/widget_summary_home_screen.dart';
import 'package:exercises_apps/features/yes_no_app/presentation/screens/yes_no_app_screen.dart';
import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
        required this.subTitle,
        required this.link,
        required this.icon});
}

const appMainMenuItems = [
  MenuItem(title: "Yes No Maybe", subTitle: "Chat", link: YesNoAppScreen.name, icon: Icons.chat_bubble),
  MenuItem(title: "Tok Tik", subTitle: "TikTok clone", link: TokTikScreen.name, icon: Icons.music_note),
  MenuItem(title: "Widgets", subTitle: "Widgets summary", link: WidgetSummaryHomeScreen.name, icon: Icons.account_tree)
];
