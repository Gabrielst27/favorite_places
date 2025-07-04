import 'package:favorite_places/models/place_model.dart';
import 'package:flutter/material.dart';

class AddPlaceForm extends StatefulWidget {
  const AddPlaceForm({super.key, required this.onSubmit});

  final Function(PlaceModel place) onSubmit;

  @override
  State<AddPlaceForm> createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends State<AddPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final newPlace = PlaceModel(
      id: 'testId',
      name: _enteredName,
      imageUrl: 'testImage',
    );
    widget.onSubmit(newPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um nome válido.';
                }
                if (value.length < 3 || value.length > 50) {
                  return 'O nome deve de 3 a 50 caracteres.';
                }
                return null;
              },
              onSaved: (value) {
                _enteredName = value!.trim().replaceFirst(
                  value[0],
                  value[0].toUpperCase(),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submit,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  const SizedBox(width: 8),
                  Text('Adicionar Lugar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
