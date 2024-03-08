import 'package:flutter/material.dart';
import 'package:take_me_home/domain/entities/station_entity.dart';
import 'package:take_me_home/domain/repository/station_repository.dart';

import 'package:take_me_home/injection_container.dart' as injection_container;
import 'package:take_me_home/presentation/router/app_router.dart';

void main() async {
  await injection_container.init();

  runApp(
    MainApp(
      appRouter: injection_container.sl(),
    ),
  );

  final StationRepository stationRepository = injection_container.sl();
  const StationEntity station = StationEntity(
    id: '8012657',
    name: 'Pößneck ob Bf',
  );
  final result = await stationRepository.getMeansOfTransportByTime(
    station,
    const TimeOfDay(hour: 18, minute: 0),
  );
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  const MainApp({
    required this.appRouter,
    super.key,
  });

  static String get title => 'Take Me Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MainApp.title,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.root,
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
    );
  }
}
