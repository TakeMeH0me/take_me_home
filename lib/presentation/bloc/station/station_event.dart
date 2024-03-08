part of 'station_bloc.dart';

sealed class StationEvent extends Equatable {
  const StationEvent();

  @override
  List<Object> get props => [];
}

final class GetMeansOfTransportByTime extends StationEvent {
  final StationEntity station;
  final TimeOfDay time;

  const GetMeansOfTransportByTime(
    this.station,
    this.time,
  );

  @override
  List<Object> get props => [station, time];
}
