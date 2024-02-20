import '../../domain/entities/home_entity.dart';

// TODO: this class is not needed for now (will be in the future, when saving stuff locally / cloud)
class HomeModel extends HomeEntity {
  const HomeModel({
    required super.id,
    required super.name,
    required super.city,
    required super.street,
    required super.streetNumber,
    required super.postcode,
  });

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    // TODO: implement
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    // TODO: implement
    throw UnimplementedError();
  }
}
