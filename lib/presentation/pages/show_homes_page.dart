import 'package:flutter/material.dart';
import '../../domain/entities/home_entity.dart';
import '../router/args/create_or_edit_home_args.dart';

import '../router/app_router.dart';
import '../widgets/widgets.dart';

/// Shows all created homes.
class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  final List<HomeEntity> _homes = [
    const HomeEntity(
      id: '1',
      name: 'Freundin',
      city: 'Gera',
      street: 'Test Street',
      streetNumber: '55a',
      postcode: 75683,
    ),
    const HomeEntity(
      id: '2',
      name: 'Elternhaus',
      city: 'Pößneck',
      street: 'Test Street',
      streetNumber: '63a',
      postcode: 07381,
    ),
    const HomeEntity(
      id: '3',
      name: 'Eigene Wohung',
      city: 'Jena',
      street: 'Coole Streeeeeeeeeeeeeeeeeeeeeeet',
      streetNumber: '99',
      postcode: 92379,
    ),
    const HomeEntity(
      id: '4',
      name: 'Anwesen in den Bergen',
      city: 'Berchtesgaden',
      street: 'An der Kuhglocke',
      streetNumber: '13c',
      postcode: 12345,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _getHomeWidgets(context),
        ),
      ),
    );
  }

  List<Widget> _getHomeWidgets(BuildContext context) {
    List<Widget> homeCardsWithSpaces = [];
    for (final HomeEntity home in _homes) {
      homeCardsWithSpaces.add(
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 75.0,
          child: HomeButton(
            homeName: home.name,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouter.showWayToHome);
            },
            onTrailingPressed: () {
              _navigateToCreateOrEditHomePage(context, home);
            },
          ),
        ),
      );

      homeCardsWithSpaces.add(const SizedBox(height: 10.0));
    }

    return homeCardsWithSpaces;
  }

  Future<void> _navigateToCreateOrEditHomePage(
    BuildContext context,
    HomeEntity home,
  ) async {
    final newHome = await Navigator.of(context).pushNamed(
      AppRouter.createOrEditHome,
      arguments: CreateOrEditHomeArgs(
        home: home,
        isNewHome: false,
      ),
    );

    if (!context.mounted || newHome == null) {
      return;
    }

    final int indexOfOldHome = _homes.indexOf(home);
    setState(() {
      _homes.removeAt(indexOfOldHome);
      _homes.insert(indexOfOldHome, newHome as HomeEntity);
    });
  }
}
