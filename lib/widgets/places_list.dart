import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/widgets/places_list_item.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => PlacesListItem(place: places[index]),
      itemCount: places.length,
    );
  }
}
