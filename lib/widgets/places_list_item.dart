import 'package:favorite_places/models/place_model.dart';
import 'package:flutter/material.dart';

class PlacesListItem extends StatelessWidget {
  const PlacesListItem({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place.name, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
