import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';

class PlacesListItem extends StatelessWidget {
  const PlacesListItem({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: FileImage(place.image),
          ),
          title: Text(
            place.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.address.road,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${place.address.suburb}, ${place.address.city}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${place.address.state}, ${place.address.country}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaceDetailsScreen(place: place),
              ),
            );
          },
        ),
      ),
    );
  }
}
