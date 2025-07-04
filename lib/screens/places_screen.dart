import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<PlaceModel> _places = [];

  void _addPlace() async {
    final place = await Navigator.of(context).push<PlaceModel>(
      MaterialPageRoute(builder: (context) => AddPlaceScreen()),
    );
    if (place == null) return;
    setState(() {
      _places.add(place);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seus Lugares',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(places: _places),
    );
  }
}
