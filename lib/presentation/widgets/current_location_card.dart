import 'package:flutter/material.dart';

class CurrentLocationCard extends StatefulWidget {
  final String startStation;
  final String distance;
  final String departureArrival;
  final String track;
  final Icon leadingIcon;
  final Icon? trailingIcon;

  const CurrentLocationCard({
    Key? key,
    required this.startStation,
    required this.distance,
    required this.departureArrival,
    required this.track,
    required this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  _CurrentLocationCardState createState() => _CurrentLocationCardState();
}

class _CurrentLocationCardState extends State<CurrentLocationCard> {
  // Hier kannst du Zustandsvariablen definieren und verwalten.

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.leadingIcon,
        title: Text("${widget.startStation}  ${widget.distance}"),
        subtitle: Text("${widget.departureArrival} \n${widget.track}"),
        trailing: ElevatedButton(
            onPressed: () {
              null;
            },
            child: widget.trailingIcon),
      ),
    );
  }
}
