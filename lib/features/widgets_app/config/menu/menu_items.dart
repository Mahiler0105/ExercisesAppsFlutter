import 'package:exercises_apps/features/widgets_app/presentation/screens/counter/counter_screen.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/theme_changer/theme_changer_screen.dart';

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
  MenuItem(
      title: 'Snackbars y Dialogos',
      subTitle: 'Indicadores de pantalla',
      link: SnackbarScreen.name,
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
      link: AnimatedScreen.name,
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controllers + Tiles',
      subTitle: 'Controles en Flutter',
      link: UiControlsScreen.name,
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introducción a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      link: AppTutorialScreen.name,
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: InfiniteScrollScreen.name,
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Contador',
      subTitle: 'Contador usando Riverpod',
      link: CounterScreen.name,
      icon: Icons.numbers),
  MenuItem(
      title: 'Gestor de temas',
      subTitle: 'Gestor de temas usando Riverpod',
      link: ThemeChangerScreen.name,
      icon: Icons.color_lens),
];
