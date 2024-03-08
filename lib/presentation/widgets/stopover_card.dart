import 'package:flutter/material.dart';

class StopoverCard extends StatefulWidget {
  final String startStation;
  final String distance;
  final String departureArrival;
  final String track;

  const StopoverCard({
    Key? key,
    required this.startStation,
    required this.distance,
    required this.departureArrival,
    required this.track,
  }) : super(key: key);

  @override
  _StopoverCardState createState() => _StopoverCardState();
}

class _StopoverCardState extends State<StopoverCard> {
  // Hier kannst du Zustandsvariablen definieren und verwalten.

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.train),
        title: Text("${widget.startStation} + ${widget.distance}"),
        subtitle: Text("${widget.departureArrival} \n${widget.track}"),
      ),
    );
  }
}
