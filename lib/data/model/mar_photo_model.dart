import 'package:hive_flutter/hive_flutter.dart';
part 'mar_photo_model.g.dart';

@HiveType(typeId: 0)
class MarsPhotoModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int sol;
//  @HiveField(2)
  final Camera camera;
  @HiveField(2)
  final String imgSrc;
  @HiveField(3)
  final String earthDate;
  MarsPhotoModel({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
  });
}

@HiveType(typeId: 1)
class Camera {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int roverId;
  @HiveField(3)
  final String fullName;
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });
}
