import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// An instance of a home you wanna go to.
class HomeEntity extends Equatable {
  final String id;
  final String name;
  final String city;
  final String street;
  final String streetNumber;
  final String postcode;

  const HomeEntity({
    required this.id,
    required this.name,
    required this.city,
    required this.street,
    required this.streetNumber,
    required this.postcode,
  });

  HomeEntity copyWith({
    String? id,
    String? name,
    String? city,
    String? street,
    String? streetNumber,
    String? postcode,
  }) {
    return HomeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      street: street ?? this.street,
      streetNumber: streetNumber ?? this.streetNumber,
      postcode: postcode ?? this.postcode,
    );
  }

  factory HomeEntity.empty() {
    return HomeEntity(
      id: const Uuid().v4(),
      name: '',
      city: '',
      street: '',
      streetNumber: '',
      postcode: '',
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      city,
      street,
      streetNumber,
      postcode,
    ];
  }
}
