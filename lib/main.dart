import 'package:flutter/material.dart';

import 'injection_container.dart' as injection_container;
import 'presentation/router/app_router.dart';

void main() async {
  await injection_container.init();

  runApp(
    MainApp(
      appRouter: injection_container.sl(),
    ),
  );
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
