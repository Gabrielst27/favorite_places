import 'dart:io';

import 'package:favorite_places/models/place_location_model.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, name TEXT, image TEXT, latitude REAL, longitude REAL, address TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class PlacesListNotifier extends StateNotifier<List<PlaceModel>> {
  PlacesListNotifier() : super([]);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data.map((row) {
      final List<String> address = (row['address'] as String)
          .split(',')
          .map((element) => element.toString().trim())
          .toList();
      return PlaceModel(
        id: row['id'] as String,
        name: row['name'] as String,
        image: File(row['image'] as String),
        address: PlaceLocationModel(
          road: address[0],
          quarter: address[1],
          suburb: address[2],
          city: address[3],
          state: address[4],
          postcode: address[5],
          country: address[6],
          iso31662lvl4: address[7],
          latitude: row['latitude'] as double,
          longitude: row['longitude'] as double,
        ),
      );
    }).toList();
    state = places;
  }

  void addPlace(PlaceModel place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$fileName');
    final newPlace = PlaceModel(
      name: place.name,
      image: copiedImage,
      address: place.address,
    );
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'name': newPlace.name,
      'image': newPlace.image.path,
      'latitude': newPlace.address.latitude,
      'longitude': newPlace.address.longitude,
      'address': newPlace.address.toString(),
    });
    state = [...state, newPlace];
  }
}

final placesProvider =
    StateNotifierProvider<PlacesListNotifier, List<PlaceModel>>((ref) {
      return PlacesListNotifier();
    });
