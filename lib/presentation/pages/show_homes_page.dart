import 'package:flutter/material.dart';
import 'package:take_me_home/domain/entities/home_entity.dart';
import 'package:take_me_home/presentation/router/args/create_or_edit_home_args.dart';

import '../router/app_router.dart';
import '../widgets/widgets.dart';

/// Shows all created homes.
class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  final List<HomeEntity> homes = [
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
          children: getHomeWidgets(context, homes),
        ),
      ),
    );
  }
}

List<Widget> getHomeWidgets(BuildContext context, List<HomeEntity> homesList) {
  List<Widget> homeCardsWithSpaces = [];
  for (final HomeEntity home in homesList) {
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
            Navigator.of(context).pushNamed(
              AppRouter.createOrEditHome,
              arguments: CreateOrEditHomeArgs(
                home: home,
                isNewHome: false,
              ),
            );
          },
        ),
      ),
    );

    homeCardsWithSpaces.add(const SizedBox(height: 10.0));
  }

  return homeCardsWithSpaces;
}
