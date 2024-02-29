import 'package:flutter/material.dart';
import 'package:take_me_home/domain/entities/means_of_transport_entity.dart';

class MeansOfTransportModel extends MeansOfTransportEntity {
  const MeansOfTransportModel({
    required String name,
    required TimeOfDay departureTime,
    required bool isCancelled,
    required int delayInMinutes,
  }) : super(
          name: name,
          departureTime: departureTime,
          isCancelled: isCancelled,
          delayInMinutes: delayInMinutes,
        );

  factory MeansOfTransportModel.fromPlainText(String input) {
    final List<String> splitInput = input.split('\n');

    final String departureTimeAsString = splitInput[0];
    final TimeOfDay departureTime = TimeOfDay(
      hour: int.parse(departureTimeAsString.split(':')[0]),
      minute: int.parse(departureTimeAsString.split(':')[1]),
    );

    final String name = splitInput[1];

    final String delayInformationAsString = splitInput[2];
    if (delayInformationAsString == 'cancel') {
      return MeansOfTransportModel(
        name: name,
        departureTime: departureTime,
        isCancelled: true,
        delayInMinutes: 0,
      );
    } else if (delayInformationAsString == 'no') {
      return MeansOfTransportModel(
        name: name,
        departureTime: departureTime,
        isCancelled: false,
        delayInMinutes: 0,
      );
    } else {
      final String delayLine = splitInput[2];
      final int delayInMinutes = int.parse(delayLine.substring(2));
      return MeansOfTransportModel(
        name: name,
        departureTime: departureTime,
        isCancelled: false,
        delayInMinutes: delayInMinutes,
      );
    }
  }
}
