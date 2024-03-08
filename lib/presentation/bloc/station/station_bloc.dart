import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:take_me_home/domain/entities/means_of_transport_entity.dart';
import 'package:take_me_home/domain/entities/station_entity.dart';
import 'package:take_me_home/domain/repository/station_repository.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository stationRepository;
  final List<MeansOfTransportEntity> currentMeansOfTransport = [];

  final String trainId = 'RE 80851';

  StationBloc({required this.stationRepository}) : super(StationInitial()) {
    on<GetMeansOfTransportByTime>(handleGetMeansOfTransportByTime);
  }

  void handleGetMeansOfTransportByTime(
    GetMeansOfTransportByTime event,
    Emitter<StationState> emit,
  ) async {
    emit(StationLoading());

    final result = await stationRepository.getMeansOfTransportByTime(
      event.station,
      event.time,
    );

    result.fold(
      (failure) => emit(
        const StationError('Error while loading means of transport.'),
      ),
      (meansOfTransportEntities) {
        final MeansOfTransportEntity? nextMeansOfTransport =
            _getCorrectMeansOfTransport(meansOfTransportEntities);

        if (nextMeansOfTransport == null) {
          return;
        }

        currentMeansOfTransport.add(nextMeansOfTransport);
        currentMeansOfTransport.sort((a, b) {
          final aTime = a.departureTime;
          final bTime = b.departureTime;

          if (aTime.hour == bTime.hour) {
            return aTime.minute.compareTo(bTime.minute);
          }

          return aTime.hour.compareTo(bTime.hour);
        });

        emit(StationsUpdated(currentMeansOfTransport));
      },
    );
  }

  MeansOfTransportEntity? _getCorrectMeansOfTransport(
    List<MeansOfTransportEntity> meansOfTransportEntities,
  ) {
    for (final meansOfTransportEntity in meansOfTransportEntities) {
      if (meansOfTransportEntity.name == trainId) {
        return meansOfTransportEntity;
      }
    }

    return null;
  }
}
