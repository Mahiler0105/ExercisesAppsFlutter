import '../../presentation/screens/screens.dart';
import 'package:exercises_apps/main/menu_item.dart';
import 'package:flutter/material.dart' show Icons;

const appWidgetMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones de Flutter',
      link: ButtonsScreen.name,
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: CardsScreen.name,
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y Controlados',
      link: ProgressScreen.name,
      icon: Icons.refresh_rounded),
];
