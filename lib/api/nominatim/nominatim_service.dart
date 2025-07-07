import 'dart:convert';

import 'package:favorite_places/api/nominatim/mappers/place_location_model_mapper.dart';
import 'package:favorite_places/environment.dart';
import 'package:favorite_places/models/place_location_model.dart';
import 'package:http/http.dart' as http;

class NominatimService {
  Future<PlaceLocationModel?> getReverseLocation(
    double latitude,
    double longitude,
  ) async {
    final Uri url = Uri.https(nominatimUrl, '/reverse', {
      'lat': '$latitude',
      'lon': '$longitude',
      'format': 'json',
    });
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400 ||
          response.body == 'null' ||
          response.body.isEmpty ||
          response.body == '{}') {
        return null;
      }
      final Map<String, dynamic> data = json.decode(response.body);
      final address = PlaceLocationModelMapper.toModel(
        latitude,
        longitude,
        data['address'],
      );
      return address;
    } catch (error) {
      throw Exception(error);
    }
  }
}
