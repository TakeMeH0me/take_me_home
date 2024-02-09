import 'package:flutter/material.dart';
import 'package:take_me_home/app.dart';
import '../pages/pages.dart';

class AppRouter {
  static const String root = '/';
  static const String createOrEditHome = '/create_or_edit_home';
  static const String showWayToHome = '/show_way_to_home';

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const App());
      case createOrEditHome:
        return MaterialPageRoute(builder: (_) => const CreateOrEditHomePage());
      case showWayToHome:
        return MaterialPageRoute(builder: (_) => const ShowWayToHomePage());
      default:
        return null;
    }
  }
}
