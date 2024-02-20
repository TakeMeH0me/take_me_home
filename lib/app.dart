import 'package:flutter/material.dart';

import 'presentation/pages/pages.dart';
import 'presentation/router/app_router.dart';

/// Wrapper for the [MainApp].
/// Controls logic for stuff like tabs, etc.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.createOrEditHome);
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: ShowHomesPage(),
          ),
        ),
      ),
    );
  }
}
