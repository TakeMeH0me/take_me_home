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
      (meansOfTransportEntities) => emit(
        StationLoaded(meansOfTransportEntities),
      ),
    );
  }
}
