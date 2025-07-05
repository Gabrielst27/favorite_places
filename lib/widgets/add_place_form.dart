import 'dart:io';

import 'package:favorite_places/models/address_model.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceForm extends ConsumerStatefulWidget {
  const AddPlaceForm({super.key, required this.onSubmit});

  final Function() onSubmit;

  @override
  ConsumerState<AddPlaceForm> createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends ConsumerState<AddPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  File? _pickedImage;
  AddressModel? _pickedAddress;

  void _pickImage(File image) {
    _pickedImage = image;
  }

  void _pickAddress(AddressModel address) {
    _pickedAddress = address;
  }

  void _submit(WidgetRef ref) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_pickedImage == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, adicione uma imagem')),
      );
      return;
    }
    if (_pickedAddress == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, adicione a localização')),
      );
      return;
    }
    _formKey.currentState!.save();
    final newPlace = PlaceModel(
      name: _enteredName,
      image: _pickedImage!,
      address: _pickedAddress!,
    );
    ref.read(placesProvider.notifier).addPlace(newPlace);
    widget.onSubmit();
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
            ImageInput(
              onPickImage: _pickImage,
            ),
            const SizedBox(height: 16),
            LocationInput(
              onPickAddress: _pickAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submit(ref),
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
