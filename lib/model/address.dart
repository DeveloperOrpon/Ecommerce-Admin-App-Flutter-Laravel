import 'dart:developer';
import '../helper/helper.dart';

class Address {
  num? id;
  String? firstName;
  String? lastName;
  String? email;
  String? street;
  String? apartment;
  String? block;
  String? city;
  String? state;
  String? country;
  String? countryId;
  String? phoneNumber;
  String? zipCode;
  String? mapUrl;
  String? latitude;
  String? longitude;
  String? addressType;
  bool? isDefault;

  Address(
      {this.firstName,
        this.lastName,
        this.email,
        required this.id,
        this.street,
        this.apartment,
        this.block,
        this.city,
        this.state,
        this.country,
        this.phoneNumber,
        this.addressType,
        this.zipCode,
        this.mapUrl,
        this.latitude,
        this.isDefault,
        this.longitude});

  Address.fromJson(Map parsedJson) {
    try{
      id = parsedJson['id'] ?? 0;
      firstName = parsedJson['firstName'] ?? '';
      lastName = parsedJson['last_name'] ?? '';
      apartment = parsedJson['apartment'] ?? '';
      street = parsedJson['state'] ?? '';
      block = parsedJson['block'] ?? '';
      city = parsedJson['city'] ?? '';
      state = parsedJson['state'] ?? '';
      country = parsedJson['country'] ?? '';
      email = parsedJson['email'] ?? '';
      isDefault = parsedJson['is_default'] ?? false;
      addressType = parsedJson['addressType'] ?? '';
      phoneNumber = parsedJson['phone'] ?? '';
      zipCode = parsedJson['postcode'];
    }catch(e){
      log("AddressJsonError: $e");
    }
  }

  Address.fromOpencartJson(Map parsedJson) {
    id = parsedJson['id'] ?? 0;
    firstName = parsedJson['firstname'];
    lastName = parsedJson['lastname'];
    apartment = parsedJson['company'];
    street = parsedJson['address_1'];
    block = parsedJson['address_2'];
    city = parsedJson['city'];
    state = parsedJson['zone_id'];
    country = parsedJson['country_id'];
    zipCode = parsedJson['postcode'];
  }

  Address.fromMagentoJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson['firstname'];
    id = parsedJson['id'] ?? 0;
    lastName = parsedJson['lastname'];
    if (parsedJson['street'] != null) {
      var streets = List.from(parsedJson['street']);
      street = streets.isNotEmpty ? streets[0] : '';
      block = streets.length > 1 ? streets[1] : '';
    }

    city = parsedJson['city'];
    state = parsedJson['region'];
    country = parsedJson['country_id'];
    email = parsedJson['email'];
    phoneNumber = parsedJson['telephone'];
    zipCode = parsedJson['postcode'];
  }

  Address.fromPrestaJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson['firstname'];
    id = parsedJson['id'] ?? 0;
    lastName = parsedJson['lastname'];
    street = parsedJson['address1'];
    block = parsedJson['address2'];
    city = parsedJson['city'];
    country = parsedJson['id_country'];
    phoneNumber = parsedJson['phone'];
    zipCode = parsedJson['postcode'];
  }

  Map<String, dynamic> toJson() {
    var address = <String, dynamic>{
      'id':id,
      'first_name': firstName,
      'last_name': lastName,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'city': city,
      'state': state,
      'country': country,
      'phone': phoneNumber,
      'postcode': zipCode,
      'mapUrl': mapUrl,
    };
    if (email != null && email!.isNotEmpty) {
      address['email'] = email;
    }
    return address;
  }

  Map<String, dynamic> toWCFMJson() {
    var address = toJson();
    if (street?.isNotEmpty ?? false) {
      address['wcfmmp_user_location'] = street;
    }
    if (latitude?.isNotEmpty ?? false) {
      address['wcfmmp_user_location_lat'] = latitude;
    }
    if (longitude?.isNotEmpty ?? false) {
      address['wcfmmp_user_location_lng'] = longitude;
    }
    return address;
  }

  Address.fromLocalJson(Map json) {
    try {
      id = json['id'] ?? 0;
      firstName = json['first_name'];
      lastName = json['last_name'];
      street = json['address_1'];
      block = json['address_2'];
      apartment = json['company'];
      city = json['city'];
      state = json['state'];
      country = json['country'];
      email = json['email'];
      phoneNumber = json['phone'];
      zipCode = json['postcode'];
      mapUrl = json['mapUrl'];
    } catch (e) {
      printLog(e.toString());
    }
  }

  Map<String, dynamic> toMagentoJson() {
    return {
      'address': {
        'region': state,
        'country_id': country,
        'region_id': state != null && int.tryParse(state!) != null
            ? int.parse(state!)
            : 0,
        'street': [
          street,
          '$apartment${(block?.isEmpty ?? true) ? '' : ' - $block'}',
        ],
        'postcode': zipCode,
        'city': city,
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'telephone': phoneNumber,
        'same_as_billing': 1
      }
    };
  }

  Map<String, dynamic> toOpencartJson() {
    return {
      'zone_id': state,
      // 'id': id,
      'country_id': countryId ?? country,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'postcode': zipCode,
      'city': city,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'telephone': phoneNumber,

    };
  }

  bool isValid() {
    return firstName!.isNotEmpty &&
        lastName!.isNotEmpty &&
        email!.isNotEmpty &&
        street!.isNotEmpty &&
        city!.isNotEmpty &&
        state!.isNotEmpty &&
        country!.isNotEmpty &&
        phoneNumber!.isNotEmpty;
  }

  Map<String, String?> toJsonEncodable() {
    return {
      'first_name': firstName,
      // 'id': (id).toString(),
      'last_name': lastName,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'city': city,
      'state': state,
      'country': country,
      'email': email,
      'phone': phoneNumber,
      'postcode': zipCode,
      'mapUrl': mapUrl,
    };
  }

  Address.fromShopifyJson(Map json) {
    try {
      firstName = json['firstName'];
      lastName = json['lastName'];
      street = json['address1'];
      block = json['address2'];
      apartment = json['company'];
      city = json['city'];
      state = json['province'];
      country = json['country'];
      email = json['email'];
      phoneNumber = json['phone'];
      zipCode = json['zip'];
    } catch (e) {
      printLog(e.toString());
    }
  }

  Map<String, dynamic> toShopifyJson() {
    return {
      'address': {
        'province': state,
        'country': country,
        'address1': street,
        'address2': block,
        'company': apartment,
        'zip': zipCode,
        'city': city,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phoneNumber,
      }
    };
  }

  Address.fromOpencartOrderJson(Map json) {
    try {
      firstName = json['shipping_firstname'];
      lastName = json['shipping_lastname'];
      street = json['shipping_address_1'];
      block = json['shipping_address_2'];
      apartment = json['shipping_company'];
      city = json['shipping_city'];
      state = json['shipping_zone'];
      country = json['shipping_country'];
      email = json['email'];
      phoneNumber = json['telephone'];
      zipCode = json['shipping_postcode'];
    } catch (e) {
      printLog(e.toString());
    }
  }

  Address.fromBigCommerceJson(Map json) {
    try {
      firstName = json['first_name'];
      lastName = json['last_name'];
      apartment = json['company'];
      street = json['street_1'];
      block = json['street_2'];
      city = json['city'];
      state = json['state'];
      zipCode = json['zip'];
      country = json['country'];
      countryId = json['country_iso2'];
      phoneNumber = json['phone'];
      email = json['email'];
    } catch (e) {
      printLog(e.toString());
    }

    //   Map<String, dynamic> toBigCommerceJson() {
    //     final data = <String, dynamic>{};
    //     data['first_name'] = firstName;
    //     data['last_name'] = lastName;
    //     data['company'] = apartment;
    //     data['street_1'] = street;
    //     data['street_2'] = block;
    //     data['city'] = city;
    //     data['state'] = state;
    //     data['zip'] = zipCode;
    //     data['country'] = country;
    //     data['country_iso2'] = countryId;
    //     data['phone'] = phoneNumber;
    //     data['email'] = email;
    //     return data;
    //   }
  }



  String get fullAddress => [
    block ?? '',
    apartment ?? '',
    street ?? '',
    city ?? '',
    state ?? '',
    zipCode ?? '',
    country ?? '',
  ].join(' ').trim();

  String get fullInfoAddress {
    var info = [];
    if (street?.isNotEmpty ?? false) {
      info.add(street);
    }

    if (block?.isNotEmpty ?? false) {
      info.add(block);
    }

    if (apartment?.isNotEmpty ?? false) {
      info.add(apartment);
    }

    if (city?.isNotEmpty ?? false) {
      info.add(city);
    }



    var address = info.join(', ');
    if (zipCode?.isNotEmpty ?? false) {
      address = '$address - $zipCode';
    }

    return address;
  }


}

class ListAddress {
  List<Address> list = [];

  List<Map<String, String?>> toJsonEncodable() {
    return list.map((item) {
      return item.toJsonEncodable();
    }).toList();
  }
}
class AddressRes {
  List<Address>? data;

  AddressRes({this.data});

  AddressRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Address>[];
      json['data'].forEach((v) {
        data!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}