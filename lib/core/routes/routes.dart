import 'package:citytech/ui/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String root = '/';
  static const String homeView = 'loginView';
  static const String ticketView = 'registerView';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case ticketView:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static Route onUnkownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
