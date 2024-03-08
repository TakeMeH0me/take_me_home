import 'package:flutter/material.dart';
import 'package:take_me_home/presentation/widgets/current_location_card.dart';
import 'package:take_me_home/presentation/widgets/stopover_card.dart';

class ShowHomesPage extends StatefulWidget {
  const ShowHomesPage({super.key});

  @override
  State<ShowHomesPage> createState() => _ShowHomesPageState();
}

class _ShowHomesPageState extends State<ShowHomesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentLocationCard(
            leadingIcon: Icon(Icons.gps_fixed),
            startStation: "Gera - Duale Dochschule",
            distance: "",
            departureArrival: "Aktueller Standort",
            track: "",
            trailingIcon: Icon(Icons.edit)),
        SizedBox(
          height: 20,
        ),
        StopoverCard(
          leadingIcon: Icon(Icons.train),
          startStation: "Gera Hbf",
          distance: "15km",
          departureArrival: "08:00 - 08:30",
          track: "Gleis 5",
          trailingIcon: Icon(Icons.work),
        ),
        StopoverCard(
          leadingIcon: Icon(Icons.train),
          startStation: "Saalfeld Hbf",
          distance: "3km",
          departureArrival: "08:00 - 08:30",
          track: "Gleis 5",
          trailingIcon: Icon(Icons.home),
        ),
      ],
    );
  }
}
