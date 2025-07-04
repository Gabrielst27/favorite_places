import 'dart:io';

import 'package:uuid/uuid.dart';

class PlaceModel {
  PlaceModel({
    required this.name,
    required this.image,
  }) : id = Uuid().v4();

  final String id;
  final String name;
  final File image;
}
