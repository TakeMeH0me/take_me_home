import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_me_home/domain/entities/home_entity.dart';
import 'package:take_me_home/domain/entities/station_entity.dart';
import 'package:take_me_home/presentation/bloc/station/station_bloc.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<StationBloc>(context).add(
      GetMeansOfTransportByTime(
        _startStation,
        TimeOfDay.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                const SizedBox(height: 10),
                BlocBuilder<StationBloc, StationState>(
                  builder: (context, state) {
                    if (state is StationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is StationError) {
                      return Text(state.message);
                    } else if (state is StationLoaded) {
                      return Column(
                        children: state.meansOfTransportEntities
                            .map(
                              (meansOfTransportEntity) => ListTile(
                                title: Text(meansOfTransportEntity.name),
                                subtitle: Text(
                                  meansOfTransportEntity.departureTime
                                      .format(context),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
