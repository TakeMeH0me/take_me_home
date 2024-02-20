import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

/// Shows all created homes.
class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: getHomeWidgets(context, getHomesAsString()),
        ),
      ),
    );
  }
}

List<Widget> getHomeWidgets(BuildContext context, List<String> homesAsString) {
  List<Widget> homeCardsWithSpaces = [];
  for (final String home in homesAsString) {
    homeCardsWithSpaces.add(
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 75.0,
        child: HomeButton(
          homeName: home,
          onPressed: () => {},
          onTrailingPressed: () => {},
        ),
      ),
    );

    homeCardsWithSpaces.add(const SizedBox(height: 10.0));
  }

  return homeCardsWithSpaces;
}

List<String> getHomesAsString() {
  return [
    'Freundin',
    'Freund',
    'Uni',
    'Elternhaus',
  ];
}
