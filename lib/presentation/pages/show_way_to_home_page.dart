import 'package:flutter/material.dart';

/// Show one trip to the selected home with single stations,
/// time between the stations and information to each single station.
///
/// The home was selected in [ShowHomesPage].
class ShowWayToHomePage extends StatefulWidget {
  const ShowWayToHomePage({super.key});

  @override
  State<ShowWayToHomePage> createState() => _ShowWayToHomePageState();
}

class _ShowWayToHomePageState extends State<ShowWayToHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text('Show Way To Home Page');
  }
}
