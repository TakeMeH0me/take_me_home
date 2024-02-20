import 'package:flutter/material.dart';

class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  @override
  Widget build(BuildContext context) {
    return _stopoverCard();
  }
}

Widget _stopoverCard() {
  return Card(
    child: ListTile(
        leading: Icon(Icons.train),
        title: Text("Startbahnhof + Entfernung"),
        subtitle: Text("Abfahrt - Ankunft \nGleis")),
  );
}
