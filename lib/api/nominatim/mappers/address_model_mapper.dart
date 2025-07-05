import 'package:favorite_places/models/address_model.dart';

class AddressModelMapper {
  static AddressModel toModel(Map<String, dynamic> data) {
    return AddressModel(
      road: data['road'],
      quarter: data['quarter'],
      suburb: data['suburb'],
      city: data['city'],
      state: data['state'],
      postcode: data['postcode'],
      country: data['country'],
    );
  }
}
