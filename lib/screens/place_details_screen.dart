import 'package:favorite_places/environment.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: FlutterMap(
                      options: MapOptions(
                        initialZoom: 15,
                        initialCenter: LatLng(
                          place.address.latitude,
                          place.address.longitude,
                        ),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: openStreetMapUrlTemplate,
                          userAgentPackageName:
                              openStreetMapUserAgentPackageName,
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(
                                place.address.latitude,
                                place.address.longitude,
                              ),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 24,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${place.address.road}, ${place.address.suburb}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '${place.address.city} - ${place.address.state}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
