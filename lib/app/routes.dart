import 'package:flutter/material.dart';
//import 'package:voice_up_ime/screens/home_screen.dart';
import '../navigation/bottom_nav_scaffold.dart';

class AppRoutes {
  static const String root = '/';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.root: (context) => const BottomNavScaffold(),
};
