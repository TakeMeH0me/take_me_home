import 'package:flutter/material.dart';

import 'presentation/router/app_router.dart';

void main() {
  runApp(MainApp(
    appRouter: AppRouter(),
  ));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  const MainApp({
    required this.appRouter,
    super.key,
  });

  static String get title => 'Take Me Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MainApp.title,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.root,
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
    );
  }
}
