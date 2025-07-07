import 'package:favorite_places/models/place_location_model.dart';

class PlaceLocationModelMapper {
  static PlaceLocationModel toModel(
    double latitude,
    double longitude,
    Map<String, dynamic> data,
  ) {
    return PlaceLocationModel(
      latitude: latitude,
      longitude: longitude,
      road: data['road'],
      quarter: data['quarter'],
      suburb: data['suburb'],
      city: data['city'],
      state: data['state'],
      postcode: data['postcode'],
      country: data['country'],
      iso31662lvl4: data['ISO3166-2-lvl4'],
    );
  }
}
