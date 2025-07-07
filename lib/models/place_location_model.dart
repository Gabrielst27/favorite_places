class PlaceLocationModel {
  final double latitude;
  final double longitude;
  final String road;
  final String quarter;
  final String suburb;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String iso31662lvl4;

  PlaceLocationModel({
    required this.road,
    required this.quarter,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.iso31662lvl4,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return '$road, $quarter, $suburb, $city, $state, $postcode, $country, $iso31662lvl4';
  }
}
