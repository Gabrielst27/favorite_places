import 'package:favorite_places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListNotifier extends StateNotifier<List<PlaceModel>> {
  PlacesListNotifier() : super([]);

  void addPlace(PlaceModel place) {
    state = [...state, place];
  }
}

final placesProvider =
    StateNotifierProvider<PlacesListNotifier, List<PlaceModel>>((ref) {
      return PlacesListNotifier();
    });
