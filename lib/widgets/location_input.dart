import 'package:favorite_places/api/nominatim/nominatim_service.dart';
import 'package:favorite_places/environment.dart';
import 'package:favorite_places/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onPickAddress});

  final void Function(AddressModel address) onPickAddress;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  LocationData? _pickedLocation;
  bool _isLoadingLocation = false;
  AddressModel? _address;

  void _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    setState(() {
      _pickedLocation = locationData;
    });
    final locationService = NominatimService();
    final address = await locationService.getReverseLocation(
      _pickedLocation!.latitude!,
      _pickedLocation!.longitude!,
    );
    if (address == null) {
      _isLoadingLocation = false;
      return;
    }
    setState(() {
      _address = address;
      _isLoadingLocation = false;
    });
    widget.onPickAddress(address);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      'Nenhuma localização selecionada',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
    if (_isLoadingLocation) {
      content = CircularProgressIndicator();
    }
    if (_address != null) {
      content = Center(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(
              _pickedLocation!.latitude!,
              _pickedLocation!.longitude!,
            ),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: openStreetMapUrlTemplate,
              userAgentPackageName: openStreetMapUserAgentPackageName,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                    _pickedLocation!.latitude!,
                    _pickedLocation!.longitude!,
                  ),
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withAlpha(75),
            ),
          ),
          child: Center(child: content),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: Text(
                'Localização atual',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: Text(
                'Selecionar localização',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
