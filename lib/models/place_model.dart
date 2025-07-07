import 'dart:io';

import 'package:favorite_places/models/place_location_model.dart';
import 'package:uuid/uuid.dart';

class PlaceModel {
  PlaceModel({
    required this.name,
    required this.image,
    required this.address,
    String? id,
  }) : id = id ?? Uuid().v4();

  final String id;
  final String name;
  final File image;
  final PlaceLocationModel address;
}
