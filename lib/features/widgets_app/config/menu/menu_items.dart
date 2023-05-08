import 'package:exercises_apps/main/menu_item.dart';
import 'package:flutter/material.dart' show Icons;

const appWidgetMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones de Flutter',
      link: 'buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: 'card',
      icon: Icons.credit_card)
];
