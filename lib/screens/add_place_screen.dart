import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/widgets/add_place_form.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  _savePlace(PlaceModel place) {
    Navigator.of(
      context,
    ).pop(place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicione um novo lugar'),
      ),
      body: AddPlaceForm(onSubmit: _savePlace),
    );
  }
}
