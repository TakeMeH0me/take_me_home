import 'package:flutter/material.dart';
import 'package:take_me_home/domain/entities/home_entity.dart';
import 'package:take_me_home/domain/entities/station_entity.dart';

/// Show one trip to the selected home with single stations,
/// time between the stations and information to each single station.
///
/// The home was selected in [ShowHomesPage].
class ShowWayToHomePage extends StatefulWidget {
  final HomeEntity home;

  const ShowWayToHomePage({
    super.key,
    required this.home,
  });

  @override
  State<ShowWayToHomePage> createState() => _ShowWayToHomePageState();
}

class _ShowWayToHomePageState extends State<ShowWayToHomePage> {
  late final StationEntity _startStation = const StationEntity(
    id: '8010125',
    name: 'Gera Hbf',
  );
  // TODO: später sollte dann die Station im Home mit drinnen sein (also als mainStation oder so)
  late final StationEntity _endStation = const StationEntity(
    id: '8012657',
    name: 'Pößneck ob Bf',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.home.name,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                'Du musst in #### Minuten loslaufen! 🏃‍♂️',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
