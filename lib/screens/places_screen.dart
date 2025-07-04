import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  void _goToAddPlaceScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddPlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seus Lugares',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: _goToAddPlaceScreen,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(places: places),
    );
  }
}
