import 'package:flutter/material.dart';

import 'domain/entities/home_entity.dart';
import 'presentation/pages/pages.dart';
import 'presentation/router/app_router.dart';
import 'presentation/router/args/create_or_edit_home_args.dart';

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
          Navigator.of(context).pushNamed(
            AppRouter.createOrEditHome,
            arguments: CreateOrEditHomeArgs(
              home: HomeEntity.empty(),
              isNewHome: true,
            ),
          );
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
