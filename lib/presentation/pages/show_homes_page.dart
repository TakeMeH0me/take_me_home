import 'package:flutter/material.dart';
import 'package:take_me_home/presentation/widgets/stopover_card.dart';

class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  @override
  Widget build(BuildContext context) {
    return StopoverCard(
        startStation: "Gera Hbf",
        distance: "15km",
        departureArrival: "08:00 - 08:30",
        track: "Gleis 5");
  }
}
