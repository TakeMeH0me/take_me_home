import 'package:flutter/material.dart';

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
        child: ElevatedButton(
          onPressed: () => {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.edit),
            contentPadding: const EdgeInsets.all(0.0),
            title: Text(home),
          ),
        ),
      ),
    );

    homeCardsWithSpaces.add(
      const SizedBox(
        height: 10.0,
      ),
    );
  }

  return homeCardsWithSpaces;
}

List<String> getHomesAsString() {
  return [
    'Freundin',
    'Uni',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
    'Elternhaus',
  ];
}
