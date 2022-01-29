import 'package:flutter/material.dart';
import 'package:sdfsdf/core/navigation_bar/navigation_bar.dart';
import 'package:sdfsdf/features/donate_us/presentation/screens/donate_us_screen.dart';
import 'package:sdfsdf/features/dua/presentation/screens/dua_screen.dart';

class RouteGenerator {
  static const String bottomTab = '/';
  static const String duaScreen = '/dua_screen';
  static const String donateUsScreen = '/donate_us_screen';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case bottomTab:
        return MaterialPageRoute(builder: (_) => const BottomNav3());
      case duaScreen:
        return MaterialPageRoute(builder: (_) => const DuaScreen());
      case donateUsScreen:
        return MaterialPageRoute(builder: (_) => const DonateUsScreen());
      default:
        throw Exception('route not found');
    }
  }
}
